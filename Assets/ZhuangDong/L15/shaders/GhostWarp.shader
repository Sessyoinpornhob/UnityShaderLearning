Shader "ZD/L15/GhostWarp" {
//shader路径名
    Properties {
        _MainTex ("RGB:颜色 A:透明度贴图", 2D) = "gray"{}
        _Opacity ("透明度", range(0.0,1.0)) = 0.5
        [Header(Warp)]
        [Space(10)]
        _WarpTex ("RG:扭曲图 B:噪声图", 2d) = "gray"{}
        _WarpInt ("扭曲强度", range(0, 0.5)) = 0.5
        _NoiseInt ("噪声强度", range(0, 5)) = 0.5
        _FlowSpeed ("噪声图流动速度", range(0, 5)) = 5
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
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend one OneMinusSrcAlpha      //修改混合方式One/SrcAlpha OneMinusSrcAlpha
            
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
            uniform sampler2D _WarpTex; uniform float4 _WarpTex_ST;
            uniform half _WarpInt;
            uniform half _NoiseInt;
            uniform half _FlowSpeed;
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv0 : TEXCOORD0;       // UV采样
                float2 uv1 : TEXCOORD1;
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv0 = v.uv;
                o.uv1 = TRANSFORM_TEX(v.uv, _WarpTex);
                o.uv1.y = o.uv1.y + frac(_Time.x * _FlowSpeed);
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                half3 var_WarpTex = tex2D(_WarpTex, i.uv1).rgb;
                float2 uvBias = (var_WarpTex - 0.5) * _WarpInt;
                //float2 uvBias = var_WarpTex* _WarpInt;
                float2 uv0 = i.uv0 + uvBias;
                half4 var_MainTex = tex2D(_MainTex, uv0);
                half3 finalRGB = var_MainTex.rgb;

                half noise = lerp(1, var_WarpTex.b*2, _NoiseInt);
                noise = max(0.0, noise);
                
                half var_Opacity = var_MainTex.a * _Opacity * noise;
                return float4(finalRGB*var_Opacity, var_Opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
