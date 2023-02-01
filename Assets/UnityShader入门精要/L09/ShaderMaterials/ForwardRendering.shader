Shader "FLL/C09-ForwardRendering"
{
	Properties
    {
        _DiffuseCol ("漫反射颜色", color) = (1.0,1.0,1.0,1.0)
    	_SpecCol ("镜面反射颜色", color) = (1.0,1.0,1.0,1.0)
        _SpecRange ("镜面反射率", range(1,20)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma multi_compile_fwdbase
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            
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
                float3 relDir = normalize(reflect(-lDirWS, i.nDirWS));
                // 中间计算
                float ndotl = max(dot(nDirWS,lDirWS),0);
                float hdotv = max(dot(vDirWS, relDir),0);
                // 光照模型
                fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;
                float3 Lambert = max(ndotl,0) * _DiffuseCol * _LightColor0.rgb;
                float3 Pnong = pow(max(hdotv,0), _SpecRange) * _SpecCol * _LightColor0.rgb;
                // 光线衰减
                fixed atten = 1.0;
                fixed3 FinalColor = Lambert + Pnong;
                return fixed4(ambient + FinalColor * atten, 1.0);
            }
            ENDCG
        }
        Pass {
			// Pass for other pixel lights
			Tags { "LightMode"="ForwardAdd" }
			
			Blend One One
			CGPROGRAM
			// Apparently need to add this declaration
			#pragma multi_compile_fwdadd
			
			#pragma vertex vert
			#pragma fragment frag
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			
			fixed4 _DiffuseCol;
			fixed4 _SpecCol;
			float _SpecRange;
			
			struct a2v {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};
			
			struct v2f {
				float4 pos : SV_POSITION;
				float3 worldNormal : TEXCOORD0;
				float3 worldPos : TEXCOORD1;
			};
			
			v2f vert(a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				return o;
			}
			
			fixed4 frag(v2f i) : SV_Target {
				fixed3 worldNormal = normalize(i.worldNormal);
				#ifdef USING_DIRECTIONAL_LIGHT
					fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
				#else
					fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz - i.worldPos.xyz);
				#endif
				
				fixed3 diffuse = _LightColor0.rgb * _DiffuseCol.rgb * max(0, dot(worldNormal, worldLightDir));
				
				fixed3 viewDir = normalize(_WorldSpaceCameraPos.xyz - i.worldPos.xyz);
				fixed3 halfDir = normalize(worldLightDir + viewDir);
				fixed3 specular = _LightColor0.rgb * _SpecCol.rgb * pow(max(0, dot(worldNormal, halfDir)), _SpecRange);
				
				#ifdef USING_DIRECTIONAL_LIGHT
					fixed atten = 1.0;
				#else
					#if defined (POINT)
				        float3 lightCoord = mul(unity_WorldToLight, float4(i.worldPos, 1)).xyz;
				        fixed atten = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;
				    #elif defined (SPOT)
				        float4 lightCoord = mul(unity_WorldToLight, float4(i.worldPos, 1));
				        fixed atten = (lightCoord.z > 0) * 
								tex2D(_LightTexture0, lightCoord.xy / lightCoord.w + 0.5).w * 
								tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;
				    #else
				        fixed atten = 1.0;
				    #endif
				#endif

				return fixed4((diffuse + specular) * atten, 1.0);
			}
			ENDCG
		}
    }
}
