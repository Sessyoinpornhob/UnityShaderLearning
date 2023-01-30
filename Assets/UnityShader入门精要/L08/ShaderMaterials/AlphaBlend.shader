Shader "FLL/C08-AlphaBlend"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _MainCol ("主要颜色", color) = (1.0,1.0,1.0,1.0)
        _AlphaScale ("AlphaScale", range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "IgnorePrnjeccor"="True" "RenderType"="Transparent" }
        LOD 100

        Pass
        {
            Tags{ "LightMode"="ForwardBase" }   // 用于得到内置光照变量
            ZWrite off
            Blend SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"

            fixed4 _MainCol;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed _AlphaScale;
            
            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };
            struct VertexOutput
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float3 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.posWS = UnityObjectToWorldDir(v.vertex).xyz;
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                fixed3 nDirWS = normalize(i.nDirWS);
                fixed3 lDirWS = normalize(UnityWorldSpaceLightDir(i.posWS));
                fixed4 Texcol = tex2D(_MainTex, i.uv);
                
                // 光照模型
                fixed3 albedo = Texcol.rgb * _MainCol.rgb;
                fixed3 ambient= UNITY_LIGHTMODEL_AMBIENT.xyz * albedo;
                fixed3 diffuse = _LightColor0.rgb * albedo * max(dot(nDirWS,lDirWS),0);
                fixed3 FinalColor = ambient + diffuse;
                
                return fixed4(FinalColor, Texcol.a * _AlphaScale);
            }
            ENDCG
        }
    }
}
