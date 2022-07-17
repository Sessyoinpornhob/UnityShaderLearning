Shader "ZD/L07/OldSchoolP_code" {
//shader路径名
    Properties {
        _BaseColor      ("基本颜色", Color) = (0.5,0.5,0.5,1)
        _LightCol       ("光颜色", Color) = (0.5,0.5,0.5,1)
        _SpecularPower  ("高光次幂", Range(0, 10)) = 10
        _EnvUpCol       ("环境天顶颜色", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol     ("环境地表颜色", Color) = (0.5,0.5,0.5,1)
        _EnvSideCol     ("环境水平颜色", Color) = (0.5,0.5,0.5,1)
        _AOMap          ("AO图", 2D) = "white" {}
        _EnvColInt      ("环境光强度", Range(0, 1)) = 0
    }
    //材质面板参数
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            // unity自带的阴影算法
            #include "Lighting.cginc" 
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //声明变量
            uniform float3 _BaseColor;
            uniform float3 _LightCol;
            uniform float _SpecularPower;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvDownCol;
            uniform float3 _EnvSideCol;
            uniform sampler2D _AOMap;
            uniform float _EnvColInt;
            //声明变量
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL;       // 输入模型法线信息
                float2 uv0 : TEXCOORD0;       // uv信息、纹理采样用于-AO图
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 裁剪空间顶点坐标
                float2 uv0 : TEXCOORD0;         // uv信息输出
                float4 posWS : TEXCOORD1;       // 世界空间顶点位置
                float3 nDirWS : TEXCOORD2;      // 由模型法线信息换算世界空间法线信息
                LIGHTING_COORDS(3,4)            // unity封装好的阴影 投影坐标
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv0 = v.uv0;                                   // 数据传递
                o.posWS = mul( unity_ObjectToWorld, v.vertex );  // 变换顶点位置
                o.nDirWS = UnityObjectToWorldNormal( v.normal ); // 变换法线信息 赋值给输出结构
                TRANSFER_VERTEX_TO_FRAGMENT(o);
                return o;                                        // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDir = i.nDirWS;                                       // 获取世界坐标下法线方向
                float3 lDir = _WorldSpaceLightPos0.xyz;                       // 归一化光方向
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);  // 获取摄像机方向（不会写的看forge
                float3 relDir = normalize(reflect(-lDir, i.nDirWS));
                
                //准备中间数据 > 点乘结果
                float ndotl = dot(nDir, lDir);      //用于漫反射 Lambert光照模型
                float vdotl = dot(vDir, relDir);    //用于镜面反射 Phong光照模型
                
                //光照模型(直接光照)
                float shadow = LIGHT_ATTENUATION(i);
                float lambert = max(0.0, ndotl);
                float Phong = pow(max(0.0, vdotl), _SpecularPower );
                float3 dirLighting = (_BaseColor * lambert + Phong) * _LightCol * shadow;
                
                //光照模型（环境光照）
                float upMask = max(nDir.g, 0.0);
                float downMask = max(-nDir.g, 0.0);
                float sideMask = 1 - upMask - downMask;
                //混合环境光颜色
                float3 envCol = _EnvColInt * _BaseColor * (_EnvUpCol * upMask + _EnvDownCol * downMask + _EnvSideCol * sideMask);
                //环境光遮蔽
                float occulusion = tex2D(_AOMap, i.uv0);
                float3 envColor = envCol * occulusion;

                float3 finalRGB = envColor + dirLighting;
                //返回结果
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
