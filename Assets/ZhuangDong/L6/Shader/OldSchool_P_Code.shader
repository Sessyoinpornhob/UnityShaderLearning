Shader "ZD/L6/OldSchool_Phong" {
//shader路径名
    Properties {
        _MainCol("颜色", color) = (1.0, 1.0, 1.0, 1.0)
        //_MainLightCol("高光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularPow("高光次幂", range(1, 100)) = 30
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //声明变量
            uniform float3 _MainCol;
            uniform float _SpecularPow;
            //uniform float _MainLightCol;
            //声明变量
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL;       // 输入模型法线信息
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 posCS : SV_POSITION;     // 裁剪空间顶点坐标
                float4 posWS : TEXCOORD0;       // 世界空间顶点位置
                float3 nDirWS : TEXCOORD1;      // 由模型法线信息换算世界空间法线信息
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                // 新建一个输出结构
                o.posCS = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.posWS = mul( unity_ObjectToWorld, v.vertex );  // 变换顶点位置
                o.nDirWS = UnityObjectToWorldNormal( v.normal ); // 变换法线信息 赋值给输出结构
                return o;                                        // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDir = i.nDirWS;                                       // 获取世界坐标下法线方向
                float3 lDir = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWS.xyz, _WorldSpaceLightPos0.w));            // 归一化光方向
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);  // 获取摄像机方向（不会写的看forge
                float3 relDir = normalize(reflect(-lDir, i.nDirWS));
                //准备中间数据 > 点乘结果
                float ndotl = dot(nDir, lDir);      //用于漫反射 Lambert光照模型
                float vdotl = dot(vDir, relDir);    //用于镜面反射 Phong光照模型
                //光照模型
                float lambert = max(0.0, ndotl);
                float Phong = pow(max(0.0, vdotl), _SpecularPow );
                float3 finalRGB = _MainCol * lambert + Phong;
                //返回结果
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
