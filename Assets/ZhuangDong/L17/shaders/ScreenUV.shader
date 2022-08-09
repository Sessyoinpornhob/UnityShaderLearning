Shader "ZD/L17/ScreenUV" {
//shader路径名
    Properties {
        _MainTex ("RGB:颜色 A:透明度贴图", 2D) = "gray"{}
        _Opacity ("不透明度", range(0.0,1.0)) = 0.5
        _ScreenTex ("屏幕纹理", 2D) = "black"{}
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
            Blend One OneMinusSrcAlpha      //修改混合方式One/SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //输入参数
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half _Opacity;
            uniform sampler2D _ScreenTex; uniform float4 _ScreenTex_ST;
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv : TEXCOORD0;        // UV采样
                float2 screenuv : TEXCOORD1;
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);          // 重映射纹理
                // 调整屏幕uv
                float3 posVS = UnityObjectToViewPos(v.vertex).xyz;
                float originDist = UnityObjectToViewPos(float3(0.0,0.0,0.0)).z;
                o.screenuv = posVS.xy / posVS.z * originDist;
                o.screenuv = o.screenuv * _ScreenTex_ST.xy + frac(_Time *_ScreenTex_ST.zw);
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //纹理采样
                half4 var_MainTex = tex2D(_MainTex, i.uv);
                half var_ScreenTex = tex2D(_ScreenTex, i.screenuv).r;
                //设置 finalRGB 和 不透明度
                half3 finalRGB = var_MainTex.rgb;
                half var_Opacity = var_MainTex.a * _Opacity * var_ScreenTex;
                return float4(finalRGB * var_Opacity, var_Opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
