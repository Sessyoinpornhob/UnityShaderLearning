Shader "ZD/L14&16/Fire" {
//shader路径名
    Properties {
        _Mask ("R:外焰 G:内焰 B:透明度贴图", 2D) = "blue"{}
        _NoiseTex ("R:噪声1 G:噪声2", 2D) = "gray"{}
        _Noise1Params ("噪声1 X:大小 Y:流速 Z:强度", vector) = (1.0, 0.2, 0.2, 1.0)
        _Noise2Params ("噪声2 X:大小 Y:流速 Z:强度", vector) = (1.0, 0.2, 0.2, 1.0)
        [HDR]_Color1 ("外焰颜色", color) = (1.0,1.0,1.0,1.0)
        [HDR]_Color2 ("内焰颜色", color) = (1.0,1.0,1.0,1.0)
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
            Blend SrcAlpha OneMinusSrcAlpha      //修改混合方式One/SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //输入参数
            uniform sampler2D _Mask;
            uniform sampler2D _NoiseTex;
            uniform float3 _Noise1Params;
            uniform float3 _Noise2Params;
            uniform float3 _Color1;
            uniform float3 _Color2;
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float2 uv : TEXCOORD0;        // UV采样
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos : SV_POSITION;     // 由模型顶点信息换算屏幕空间位置
                float2 uv0 : TEXCOORD0;        // UV采样
                float2 uv1 : TEXCOORD1;        // UV采样
                float2 uv2 : TEXCOORD2;        // UV采样
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv0 = v.uv;
                o.uv1 = v.uv * _Noise1Params.x - float2(0.0, frac(_Time.x * _Noise1Params.y));
                o.uv2 = v.uv * _Noise2Params.x - float2(0.0, frac(_Time.x * _Noise2Params.y));
                return o;                                      // 输出给输出结构
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //扰动遮罩
                half warpMask = tex2D(_Mask, i.uv0).b;
                //噪声1
                half var_Noise1 = tex2D(_NoiseTex, i.uv1).r;
                //噪声2
                half var_Noise2 = tex2D(_NoiseTex, i.uv2).g;
                //噪声混合
                half noise = var_Noise1 * _Noise1Params.z + var_Noise2 * _Noise2Params.z;
                //扰动uv
                float2 warpUV = i.uv0 - float2(0.0, noise)*warpMask;
                //采样mask
                half3 var_Mask = tex2D(_Mask, warpUV);
                //计算颜色和不透明度
                half3 finalRGB = var_Mask.r * _Color1 + var_Mask.g * _Color2;
                half opacity = var_Mask.r + var_Mask.g;
                return float4(finalRGB, opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
