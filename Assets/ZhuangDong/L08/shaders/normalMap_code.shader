Shader "ZD/L08/normalMap_Code" {
//shader路径名
    Properties {
        _normalMap ("法线贴图", 2D) = "bump" {}
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
            
            //输入参数
            uniform  sampler2D _normalMap;
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL;       // 输入模型法线信息
                float4 tangent : TANGENT;
                float2 uv0 : TEXCOORD0;
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv0 : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;    // 由模型法线信息换算世界空间法线信息
                float3 tDirWS : TEXCOORD2;  
                float3 bDirWS : TEXCOORD3;
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv0 = v.uv0;
                o.nDirWS = UnityObjectToWorldNormal(v.normal); // 变换法线信息 赋值给输出结构
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                //将切线坐标轴从局部坐标转换到世界坐标
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                //叉乘，根据NT求出B
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 var_normalMap = UnpackNormal(tex2D(_normalMap, i.uv0));//实际上就是 nDirTS
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(var_normalMap, TBN));
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz); // 归一化光方向

                //光照模型计算
                float nDotl = dot(nDirWS, lDir);                     // 点乘法线方向和光方向
                float lambert = max(0.0, nDotl);                   // 由于兰伯特模型取值为[-1,1] 将 <0 值指定为0
                
                //返回值
                return float4(lambert, lambert, lambert, lambert); // 转换为四维数
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
