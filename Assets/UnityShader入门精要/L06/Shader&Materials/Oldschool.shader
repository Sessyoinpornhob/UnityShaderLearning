Shader "FLL/C06-Oldschool"
{
    Properties
    {
        _LightCol ("光颜色", color) = (1.0,1.0,1.0,1.0)
        _DiffuseCol ("漫反射颜色", color) = (1.0,1.0,1.0,1.0)
        _SpecCol ("镜面反射反射颜色", color) = (1.0,1.0,1.0,1.0)
        _SpecRange ("镜面反射率", range(1,20)) = 0
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
            
            fixed4 _LightCol;
            fixed4 _DiffuseCol;
            fixed4 _SpecCol;
            float _SpecRange;
            
            struct VertexInput
            {
                float4 pos : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct VertexOutput
            {
                float2 uv : TEXCOORD0;
                float4 posCS : SV_POSITION;    // 这玩意必须得有东西
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
            };
            
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.uv = v.uv;
                o.posCS = UnityObjectToClipPos(v.pos);
                o.posWS = mul( unity_ObjectToWorld, v.pos );
                o.nDirWS = UnityObjectToWorldDir(v.normal);
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                // 向量准备
                float3 nDirWS = i.nDirWS;
                float4 posWS = i.posWS;
                fixed4 lDirWS = normalize(_WorldSpaceLightPos0);
                fixed3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                fixed3 hDirWS = normalize(lDirWS+vDirWS);
                float3 relDir = normalize(reflect(-lDirWS, i.nDirWS));
                // 中间计算
                float ndotl = max(dot(nDirWS,lDirWS),0);
                float hdotv = max(dot(vDirWS, relDir),0);
                // 光照模型
                float3 Lambert = ndotl * _DiffuseCol * _LightCol;
                float3 Pnong = pow(hdotv, _SpecRange) * _SpecCol;
                
                fixed3 FinalColor = Lambert + Pnong;
                return fixed4(FinalColor, 1.0);
                // 有一个挺奇妙的问题：为什么Phong模型比Blinn模型效果好？
            }
            ENDCG
        }
    }
}
