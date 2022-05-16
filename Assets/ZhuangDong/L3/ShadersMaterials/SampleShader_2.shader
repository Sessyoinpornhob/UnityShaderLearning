Shader "ZD/L3/SampleShader_2" {
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
            
            struct VertexInput {
                float4 vertex : POSITION;
            };
            //输入结构：输入到顶点着色器中的结构
            
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            //输出结构：从顶点着色器中输出的结构
            
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            //顶点着色器
            
            float4 frag(VertexOutput i) : COLOR {
                return float4(1.0,0.4,0.5,0.5);
            }
            //片元着色器/像素着色器
            ENDCG
        }
    }
    FallBack "Diffuse"
}
