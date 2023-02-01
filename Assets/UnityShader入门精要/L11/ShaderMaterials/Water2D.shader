Shader "FLL/C11-Water2D"
{
    Properties
    {
        _MainTex ("河流纹理", 2D) = "white" {}
        _Color ("主颜色", color) = (1,1,1,1)
        _Magnitude ("偏移幅度", range(0,1)) = 1
        _Frequency ("偏移频率", float) = 1
        _InvWaveLength ("波长倒数", float) = 1
        _Speed ("速度", range(0,0.3)) = 1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "DisableBatching"="True" }
        LOD 100

        Pass
        {
            Tags { "LightMode" = "ForwardBase"}
            ZWrite off
            Blend SrcAlpha OneMinusSrcAlpha
            Cull off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;
            fixed _Magnitude;
            fixed _Frequency;
            float _InvWaveLength;
            fixed _Speed;
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 pos : SV_POSITION;
            };
            v2f vert (appdata v)
            {
                v2f o;
                //初始化顶点偏移
                float4 offset = float4(0.0, 0.0 ,0.0 ,0.0);
                offset.x = sin(_Frequency * _Time.y + v.vertex.x * _InvWaveLength + v.vertex.y * _InvWaveLength + v.vertex.z * _InvWaveLength) * _Magnitude;
                
                //偏移后的模型空间顶点转换到裁剪空间
                o.pos = UnityObjectToClipPos(v.vertex + offset);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                
                //通过偏移uv使纹理动起来
                o.uv +=  float2(0.0, _Time.y * _Speed);
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
    FallBack "Transparent/VertexLit"
}
