Shader "FLL/C12-BrightnessSaturationAndContrast"
{
    Properties
    {
        // 材质是不会显示在面板上的，因为这是一个脚本创建的材质。
        _MainTex ("Texture", 2D) = "white" {}
        _Brightness ("Brightness", float) = 1.0
        _Saturation ("Saturation", float) = 1.0
        _Contrast ("Contrast", float) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            // 几乎是后处理shader的标配
            ZTest Always
            Cull off
            Zwrite off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            sampler2D _MainTex;         float4 _MainTex_ST;
            float _Brightness;
            float _Saturation;
            float _Contrast;
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 renderTex = tex2D(_MainTex, i.uv);

                // 应用亮度
                fixed3 FinalColor = renderTex.rgb * _Brightness;

                // 应用饱和度
                fixed luminance = 0.2125 * renderTex.r + 0.7154 * renderTex.g + 0.0721 * renderTex.b;
                fixed3 luminanceColor = fixed3(luminance, luminance, luminance);
                FinalColor = lerp(luminanceColor, FinalColor, _Saturation);

                // 应用对比度
                fixed3 avgColor = fixed3(0.5, 0.5, 0.5);
                FinalColor = lerp(avgColor, FinalColor, _Contrast);
                
                return fixed4(FinalColor,renderTex.a);
            }
            ENDCG
        }
    }
}
