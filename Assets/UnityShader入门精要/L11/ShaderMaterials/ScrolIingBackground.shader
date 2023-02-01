Shader "FLL/C11-ScrolIingBackground"
{
    Properties
    {
        [Header(Textures)]
        _FrontTex ("前景纹理", 2D) = "white" {}
        _BackTex ("背景纹理", 2D) = "white" {}
        [Header(Speed)]
        _FrontSpeed ("前景纹理滚动速度", range(0,2)) = 1
        _BackSpeed ("背景纹理滚动速度", range(0,2)) = 1
        _Intensity ("整体亮度", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            sampler2D _FrontTex;        float4 _FrontTex_ST;
            sampler2D _BackTex;         float4 _BackTex_ST;
            fixed _FrontSpeed;
            fixed _BackSpeed;
            float _Intensity;
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct v2f
            {
                float4 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv.xy = TRANSFORM_TEX(v.uv, _FrontTex) + frac(float2(_FrontSpeed,0.0) * _Time.y);
                o.uv.zw = TRANSFORM_TEX(v.uv, _BackTex) + frac(float2(_BackSpeed,0.0) * _Time.y);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 FrontLayer = tex2D(_FrontTex, i.uv.xy);
                fixed4 BackLayer = tex2D(_BackTex, i.uv.zw);
                
                fixed4 col = lerp(BackLayer,FrontLayer,FrontLayer.a);
                col *= _Intensity;
                return col;
            }
            ENDCG
        }
    }
}
