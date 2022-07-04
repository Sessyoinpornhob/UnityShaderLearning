Shader "ZD/L03/Lambert_Code" {
//shader路径名
    Properties {
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
            //以上暂时不管
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL;       // 输入模型法线信息
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float3 nDirWS : TEXCOORD0;    // 由模型法线信息换算世界空间法线信息
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.nDirWS = UnityObjectToWorldNormal(v.normal); // 变换法线信息 赋值给输出结构
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                float3 nDir = i.nDirWS;                            // 获取世界坐标下法线方向
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz); // 归一化光方向
                float nDotl = dot(nDir, lDir);                     // 点乘法线方向和光方向
                float lambert = max(0.0, nDotl);                   // 由于兰伯特模型取值为[-1,1] 将 <0 值指定为0
                return float4(lambert, lambert, lambert, lambert); // 转换为四维数
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
