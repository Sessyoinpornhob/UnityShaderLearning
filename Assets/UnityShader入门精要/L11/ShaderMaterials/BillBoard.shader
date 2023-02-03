Shader "FLL/C11-BillBoard"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("主颜色", color) = (1,1,1,1)
        _VerticalBillboarding ("约束垂直方向的程度", range(0,1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" "Disablebatching"="True" "IgnoreProjector"="True" }
        LOD 100

        Pass
        {
            Tags{ "LightMode"="ForwardBase" }
            ZWrite off
            Blend SrcAlpha OneMinusSrcAlpha
            Cull off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            sampler2D _MainTex;         float4 _MainTex_ST;
            fixed4 _Color;
            fixed _VerticalBillboarding;

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
                float3 center = float3(0,0,0);
                float3 viewer = mul(unity_WorldToObject, float4(_WorldSpaceCameraPos,1));
                float3 normalDir = viewer - center;          // 设定法线方向即是相机方向
                // 当 _VerticalBillboarding=1 时，将法线方向固定为视角方向
                // 当 _VerticalBillboarding=0 时，将上方向固定为(0,1,0)
                normalDir.y = normalDir.y * _VerticalBillboarding;
                normalDir = normalize(normalDir);
                float3 upDir = abs(normalDir.y) > 0.999 ? float3(0,0,1) : float3(0,1,0);    // 获取大致的上方向，看不懂去看图
                float3 rightDir = normalize(cross(upDir, normalDir));                       // 准确的右方向
                upDir = normalize(cross(normalDir, rightDir));                              // 准确的上方向

                float3 centerOffest = v.vertex.xyz;
                float3 localPos = center + rightDir * centerOffest.x + upDir * centerOffest.y + normalDir * centerOffest.z;
                
                v2f o;
                o.vertex = UnityObjectToClipPos(float4(localPos,1));
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb *= _Color.rgb;
                return col;
            }
            ENDCG
        }
    }
}
