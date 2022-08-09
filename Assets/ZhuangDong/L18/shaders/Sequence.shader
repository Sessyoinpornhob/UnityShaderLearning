Shader "ZD/L18/Sequence" {
//shader路径名
    Properties {
        _MainTex    ("RGB:颜色 A:透明度贴图", 2D) = "gray"{}
        _Opacity    ("透明度", range(0.0,1.0)) = 0.5
        [Header(Sequence)][Space(10)]
        _Sequence   ("序列帧", 2D) = "gray"{}
        _RowCount   ("行数", int) = 1
        _ColCount   ("列数", int) = 1
        _Extrude    ("挤出长度", range(0,0.01)) = 0.05
        _Speed      ("火焰速度", range(0,5)) = 1
    }
    //材质面板参数
    SubShader {
        Tags {
            "Queue"="Transparent"           //调整渲染顺序
            "RenderType"="Transparent"      //改为Transparent
            "ForceNoShadowCasting"="True"   //关闭阴影投射
            "IgnoreProjector"="True"        //不响应投射器
        }
        Pass {
            Name "FORWARD_AB"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha      //修改混合方式One/SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //输入参数
            uniform sampler2D _MainTex;
            uniform half _Opacity;
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );  // 变换顶点信息 赋值给输出结构
                    o.uv = v.uv;
                return o;
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                half4 var_MainTex = tex2D(_MainTex, i.uv);
                half3 finalRGB = var_MainTex.rgb;
                half var_Opacity = var_MainTex.a * _Opacity;
                return half4(finalRGB * var_Opacity, var_Opacity);
            }
            ENDCG
        }
        
        Pass {
            Name "FORWARD_AD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend one one      //修改混合方式One/SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //输入参数
            uniform sampler2D _Sequence; uniform float4 _Sequence_ST;
            uniform half _RowCount;
            uniform half _ColCount;
            uniform half _Extrude;
            uniform half _Speed;
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL; 
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                    v.vertex.xyz += v.normal.xyz * _Extrude;
                    o.pos = UnityObjectToClipPos( v.vertex );  // 变换顶点信息 赋值给输出结构
                    o.uv = TRANSFORM_TEX(v.uv, _Sequence);      // 重映射纹理
                    float id = floor(_Time.z * _Speed);
                    float idv = floor(id / _ColCount);
                    float idu = id - idv * _ColCount;
                    float stepU = 1.0 / _ColCount;
                    float stepV = 1.0 / _RowCount;
                    float2 initUV = o.uv * float2(stepU, stepV) + float2(0.0, stepV * (_RowCount - 1.0));
                    o.uv = initUV + float2(idu * stepU, -idv * stepV);
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                half4 var_Sequence = tex2D(_Sequence, i.uv);
                half3 finalRGB = var_Sequence.rgb;
                half var_Opacity = 1.0;
                return half4(finalRGB, var_Opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
