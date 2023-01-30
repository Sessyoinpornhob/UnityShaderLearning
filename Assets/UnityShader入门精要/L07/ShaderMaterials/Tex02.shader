Shader "FLL/C07-Tex02"
{
    Properties
    {
        [Header(MainColor)]
        _MainTex ("基础颜色", 2D) = "white" {}
        _MainCol ("主要颜色", color) = (1.0,1.0,1.0,1.0)
        
        [Header(Normal)]
        _NormalTex ("法线纹理", 2D) = "bump" {}
        _BumpScale ("法线强度", float) = 1.0
        
        [Header(Metallic)]
        _MetallicTex ("金属度", 2D) = "white" {}
        _SpecCol ("镜面反射反射颜色", color) = (1.0,1.0,1.0,1.0)
        _SpecRange ("镜面反射强度", range(1,20)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="ForwardBase" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"

            fixed4 _MainCol;
            fixed4 _SpecCol;
            fixed _SpecRange;
            fixed _BumpScale;
            sampler2D _MainTex;     float4 _MainTex_ST;
            sampler2D _MetallicTex; float4 _MetallicTex_ST;
            sampler2D _NormalTex;   float4 _NormalTex_ST;
            
            struct VertexInput
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 uv : TEXCOORD0;
            };
            struct VertexOutput
            {
                float2 uv : TEXCOORD0;
                float4 pos : SV_POSITION;
                float3 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                float3 tDirWS : TEXCOORD3;
                float3 bDirWS : TEXCOORD4;
            };
            
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);           // 变换纹理坐标
                o.posWS = mul( unity_ObjectToWorld, v.vertex );
                // 计算TBN向量
                // 为什么tangent向量从切线空间转换到世界空间可以用unity_ObjectToWorld函数
                o.tDirWS = normalize(mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz);
                o.nDirWS = UnityObjectToWorldDir(v.normal);
                o.bDirWS = normalize(cross(o.tDirWS,o.nDirWS) * v.tangent.w);
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                // 准备向量
                fixed3 lDirWS = normalize(UnityWorldSpaceLightDir(i.posWS));
                fixed3 vDirWS = normalize(UnityWorldSpaceViewDir(i.posWS));
                fixed3 hDirWS = normalize(vDirWS + lDirWS);
                fixed3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 NormalTex = UnpackNormal(tex2D(_NormalTex, i.uv));//实际上就是 nDirTS
                float3 nDirWS = normalize(mul(NormalTex, TBN));

                // 纹理采样
                fixed3 albedo = tex2D(_MainTex, i.uv).rgb * _MainCol.rgb;
                fixed metallicMap = tex2D(_MetallicTex, i.uv);

                // 光照模型
                fixed3 diffuse = _LightColor0.rgb * albedo * (max(0,dot(nDirWS, lDirWS)) * 0.5 + 0.5);
                fixed3 spec = _LightColor0.rgb * _SpecCol * pow(max(0,dot(hDirWS, nDirWS)), _SpecRange) * metallicMap;  // 使用金属度纹理作为镜面反射的遮罩
                
                // 整合几个部分
                fixed3 finalcolor = diffuse + spec;
                return fixed4(finalcolor, 1.0);
            }
            ENDCG
        }
    }
    fallback " Specular "
}
