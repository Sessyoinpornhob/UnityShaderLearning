// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:821,x:34090,y:32609,varname:node_821,prsc:2|emission-8215-OUT;n:type:ShaderForge.SFN_Tex2d,id:812,x:30858,y:32984,ptovrint:False,ptlb:Normalmap,ptin:_Normalmap,varname:node_812,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:663e730a277c3e0419c4aa4792d9fca8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:8069,x:31034,y:32984,varname:node_8069,prsc:2,tffrom:2,tfto:0|IN-812-RGB;n:type:ShaderForge.SFN_Multiply,id:9695,x:32238,y:32804,cmnt:镜面反射,varname:node_9695,prsc:2|A-472-OUT,B-474-OUT;n:type:ShaderForge.SFN_Slider,id:474,x:31793,y:32973,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_474,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7367246,max:1;n:type:ShaderForge.SFN_Add,id:4814,x:32454,y:32575,varname:node_4814,prsc:2|A-3573-OUT,B-9695-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:7056,x:32410,y:32279,varname:node_7056,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5981,x:32650,y:32575,cmnt:直接光照,varname:node_5981,prsc:2|A-3268-OUT,B-4814-OUT;n:type:ShaderForge.SFN_HalfVector,id:2335,x:31612,y:32819,varname:node_2335,prsc:2;n:type:ShaderForge.SFN_Dot,id:7005,x:31793,y:32799,varname:node_7005,prsc:2,dt:0|A-8069-XYZ,B-2335-OUT;n:type:ShaderForge.SFN_Multiply,id:3268,x:32650,y:32354,cmnt:直接光照遮蔽,varname:node_3268,prsc:2|A-7056-OUT,B-5321-OUT;n:type:ShaderForge.SFN_Slider,id:5321,x:32273,y:32435,ptovrint:False,ptlb:ShadowPow,ptin:_ShadowPow,varname:node_5321,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:0.5;n:type:ShaderForge.SFN_Transform,id:1861,x:31619,y:33117,varname:node_1861,prsc:2,tffrom:0,tfto:3|IN-8069-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:6840,x:31805,y:33117,varname:node_6840,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1861-XYZ;n:type:ShaderForge.SFN_RemapRange,id:2315,x:31999,y:33117,varname:node_2315,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6840-OUT;n:type:ShaderForge.SFN_Tex2d,id:1160,x:32172,y:33117,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:node_4853,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5736963fc9a3b9843a6873553ee6562a,ntxv:3,isnm:False|UVIN-2315-OUT;n:type:ShaderForge.SFN_Multiply,id:3711,x:32361,y:33117,varname:node_3711,prsc:2|A-1160-RGB,B-9968-OUT;n:type:ShaderForge.SFN_Multiply,id:649,x:32563,y:33117,cmnt:环境光镜面反射,varname:node_649,prsc:2|A-3711-OUT,B-7575-OUT;n:type:ShaderForge.SFN_Slider,id:7575,x:32387,y:33319,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6869565,max:1;n:type:ShaderForge.SFN_Fresnel,id:9968,x:31999,y:33288,varname:node_9968,prsc:2|NRM-8069-XYZ,EXP-7304-OUT;n:type:ShaderForge.SFN_Slider,id:7304,x:31619,y:33316,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_7304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_LightVector,id:3512,x:31597,y:32371,varname:node_3512,prsc:2;n:type:ShaderForge.SFN_Dot,id:3001,x:31767,y:32371,varname:node_3001,prsc:2,dt:0|A-3512-OUT,B-8069-XYZ;n:type:ShaderForge.SFN_Clamp01,id:472,x:31994,y:32799,varname:node_472,prsc:2|IN-7005-OUT;n:type:ShaderForge.SFN_Clamp01,id:3968,x:31935,y:32371,varname:node_3968,prsc:2|IN-3001-OUT;n:type:ShaderForge.SFN_Multiply,id:3573,x:32131,y:32371,cmnt:漫反射,varname:node_3573,prsc:2|A-3968-OUT,B-6993-RGB;n:type:ShaderForge.SFN_Color,id:6993,x:31935,y:32530,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_6993,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ComponentMask,id:2217,x:31574,y:33465,varname:node_2217,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-8069-XYZ;n:type:ShaderForge.SFN_Clamp01,id:5594,x:31776,y:33465,cmnt:上遮罩,varname:node_5594,prsc:2|IN-2217-OUT;n:type:ShaderForge.SFN_Vector1,id:571,x:31561,y:33681,varname:node_571,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:9254,x:31776,y:33631,varname:node_9254,prsc:2|A-2217-OUT,B-571-OUT;n:type:ShaderForge.SFN_Clamp01,id:74,x:31957,y:33631,cmnt:下遮罩,varname:node_74,prsc:2|IN-9254-OUT;n:type:ShaderForge.SFN_Subtract,id:1708,x:31957,y:33465,varname:node_1708,prsc:2|A-5917-OUT,B-5594-OUT;n:type:ShaderForge.SFN_Vector1,id:5917,x:31776,y:33395,varname:node_5917,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:5469,x:32158,y:33465,cmnt:四周遮罩,varname:node_5469,prsc:2|A-1708-OUT,B-74-OUT;n:type:ShaderForge.SFN_Color,id:6294,x:32313,y:33477,ptovrint:False,ptlb:upCol,ptin:_upCol,varname:node_6294,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5996,x:32313,y:33654,ptovrint:False,ptlb:sideCol,ptin:_sideCol,varname:node_5996,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:976,x:32313,y:33834,ptovrint:False,ptlb:downCol,ptin:_downCol,varname:node_976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9143,x:32514,y:33477,varname:node_9143,prsc:2|A-5594-OUT,B-6294-RGB;n:type:ShaderForge.SFN_Multiply,id:8261,x:32514,y:33654,varname:node_8261,prsc:2|A-5469-OUT,B-5996-RGB;n:type:ShaderForge.SFN_Multiply,id:9480,x:32514,y:33844,varname:node_9480,prsc:2|A-74-OUT,B-976-RGB;n:type:ShaderForge.SFN_Add,id:1580,x:32730,y:33477,varname:node_1580,prsc:2|A-9143-OUT,B-8261-OUT,C-9480-OUT;n:type:ShaderForge.SFN_Multiply,id:3647,x:32918,y:33477,varname:node_3647,prsc:2|A-1580-OUT,B-9544-OUT;n:type:ShaderForge.SFN_Slider,id:9544,x:32691,y:33679,ptovrint:False,ptlb:EnvDiffuseInt,ptin:_EnvDiffuseInt,varname:node_9544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:7067,x:33133,y:33477,cmnt:BaseColor_EnvCol,varname:node_7067,prsc:2|A-6993-RGB,B-3647-OUT;n:type:ShaderForge.SFN_Add,id:44,x:32938,y:33115,varname:node_44,prsc:2|A-649-OUT,B-7067-OUT;n:type:ShaderForge.SFN_Multiply,id:3640,x:33136,y:33115,cmnt:环境光结果,varname:node_3640,prsc:2|A-5047-RGB,B-44-OUT;n:type:ShaderForge.SFN_Tex2d,id:5047,x:32938,y:32929,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_5047,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:047f9a23aa5dd9c4f8cb39b70d9ff517,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:8215,x:33909,y:32709,varname:node_8215,prsc:2|A-5981-OUT,B-3640-OUT;proporder:812-1160-5047-6993-474-5321-6294-5996-976-9544-7575-7304;pass:END;sub:END;*/

Shader "ZD/L10/Oldschool_p1" {
    Properties {
        _Normalmap ("Normalmap", 2D) = "bump" {}
        _Matcap ("Matcap", 2D) = "bump" {}
        _AO ("AO", 2D) = "white" {}
        _BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(0, 1)) = 0.7367246
        _ShadowPow ("ShadowPow", Range(0, 0.5)) = 0.5
        _upCol ("upCol", Color) = (0.5,0.5,0.5,1)
        _sideCol ("sideCol", Color) = (0.5,0.5,0.5,1)
        _downCol ("downCol", Color) = (0.5,0.5,0.5,1)
        _EnvDiffuseInt ("EnvDiffuseInt", Range(0, 1)) = 0
        _EnvSpecInt ("EnvSpecInt", Range(0, 1)) = 0.6869565
        _FresnelPow ("FresnelPow", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _ShadowPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _upCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _sideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _downCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvDiffuseInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
////// Emissive:
                float _ShadowPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ShadowPow );
                float3 _Normalmap_var = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(i.uv0, _Normalmap)));
                float3 node_8069 = mul( _Normalmap_var.rgb, tangentTransform ).xyz;
                float4 _BaseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseColor );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float2 node_2315 = (mul( UNITY_MATRIX_V, float4(node_8069.rgb,0) ).xyz.rgb.rg*0.5+0.5);
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_2315, _Matcap));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float node_2217 = node_8069.rgb.g;
                float node_5594 = saturate(node_2217); // 上遮罩
                float4 _upCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _upCol );
                float node_74 = saturate((node_2217*(-1.0))); // 下遮罩
                float4 _sideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _sideCol );
                float4 _downCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _downCol );
                float _EnvDiffuseInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDiffuseInt );
                float3 emissive = (((attenuation*_ShadowPow_var)*((saturate(dot(lightDirection,node_8069.rgb))*_BaseColor_var.rgb)+(saturate(dot(node_8069.rgb,halfDirection))*_SpecPow_var)))+(_AO_var.rgb*(((_Matcap_var.rgb*pow(1.0-max(0,dot(node_8069.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var)+(_BaseColor_var.rgb*(((node_5594*_upCol_var.rgb)+(((1.0-node_5594)-node_74)*_sideCol_var.rgb)+(node_74*_downCol_var.rgb))*_EnvDiffuseInt_var)))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _ShadowPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _upCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _sideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _downCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvDiffuseInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
