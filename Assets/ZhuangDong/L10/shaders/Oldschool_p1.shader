// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:821,x:33433,y:32531,varname:node_821,prsc:2|emission-1726-OUT;n:type:ShaderForge.SFN_Tex2d,id:812,x:31120,y:33040,ptovrint:False,ptlb:Normalmap,ptin:_Normalmap,varname:node_812,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:663e730a277c3e0419c4aa4792d9fca8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:8069,x:31296,y:33040,varname:node_8069,prsc:2,tffrom:2,tfto:0|IN-812-RGB;n:type:ShaderForge.SFN_Tex2d,id:8895,x:31722,y:32445,ptovrint:False,ptlb:Albedo,ptin:_Albedo,cmnt:表面颜色贴图,varname:node_8895,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:047f9a23aa5dd9c4f8cb39b70d9ff517,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9695,x:32229,y:32808,cmnt:镜面反射,varname:node_9695,prsc:2|A-7005-OUT,B-474-OUT;n:type:ShaderForge.SFN_Slider,id:474,x:31793,y:32973,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_474,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Add,id:4814,x:32454,y:32575,varname:node_4814,prsc:2|A-8110-OUT,B-9695-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:7056,x:32410,y:32279,varname:node_7056,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5981,x:32650,y:32575,cmnt:直接光照,varname:node_5981,prsc:2|A-3268-OUT,B-4814-OUT;n:type:ShaderForge.SFN_HalfVector,id:2335,x:31554,y:32863,varname:node_2335,prsc:2;n:type:ShaderForge.SFN_Dot,id:7005,x:31793,y:32799,varname:node_7005,prsc:2,dt:0|A-8069-XYZ,B-2335-OUT;n:type:ShaderForge.SFN_Multiply,id:3268,x:32650,y:32354,varname:node_3268,prsc:2|A-7056-OUT,B-5321-OUT;n:type:ShaderForge.SFN_Slider,id:5321,x:32253,y:32433,ptovrint:False,ptlb:ShadowPow,ptin:_ShadowPow,varname:node_5321,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.5;n:type:ShaderForge.SFN_Transform,id:1861,x:31720,y:33333,varname:node_1861,prsc:2,tffrom:0,tfto:3|IN-8069-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:6840,x:31906,y:33333,varname:node_6840,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1861-XYZ;n:type:ShaderForge.SFN_RemapRange,id:2315,x:32100,y:33333,varname:node_2315,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6840-OUT;n:type:ShaderForge.SFN_Tex2d,id:1160,x:32273,y:33333,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:node_4853,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5736963fc9a3b9843a6873553ee6562a,ntxv:3,isnm:False|UVIN-2315-OUT;n:type:ShaderForge.SFN_Multiply,id:3711,x:32462,y:33333,varname:node_3711,prsc:2|A-1160-RGB,B-9968-OUT;n:type:ShaderForge.SFN_Multiply,id:649,x:32664,y:33333,cmnt:环境光镜面反射,varname:node_649,prsc:2|A-3711-OUT,B-7575-OUT;n:type:ShaderForge.SFN_Slider,id:7575,x:32488,y:33535,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6869565,max:1;n:type:ShaderForge.SFN_Fresnel,id:9968,x:32100,y:33504,varname:node_9968,prsc:2|NRM-8069-XYZ,EXP-7304-OUT;n:type:ShaderForge.SFN_Slider,id:7304,x:31720,y:33532,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_7304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:1726,x:32971,y:32848,varname:node_1726,prsc:2|A-5981-OUT,B-649-OUT;n:type:ShaderForge.SFN_Multiply,id:8110,x:32104,y:32574,cmnt:漫反射,varname:node_8110,prsc:2|A-8895-RGB,B-4479-OUT;n:type:ShaderForge.SFN_Slider,id:4479,x:31702,y:32671,ptovrint:False,ptlb:AlbedoPow,ptin:_AlbedoPow,varname:node_4479,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;proporder:812-8895-4479-1160-474-7575-5321-7304;pass:END;sub:END;*/

Shader "ZD/L10/Oldschool_p1" {
    Properties {
        _Normalmap ("Normalmap", 2D) = "bump" {}
        _Albedo ("Albedo", 2D) = "black" {}
        _AlbedoPow ("AlbedoPow", Range(0, 10)) = 1
        _Matcap ("Matcap", 2D) = "bump" {}
        _SpecPow ("SpecPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 1)) = 0.6869565
        _ShadowPow ("ShadowPow", Range(0, 0.5)) = 0
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
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _ShadowPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _AlbedoPow)
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
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(i.uv0, _Albedo)); // 表面颜色贴图
                float _AlbedoPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _AlbedoPow );
                float3 _Normalmap_var = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(i.uv0, _Normalmap)));
                float3 node_8069 = mul( _Normalmap_var.rgb, tangentTransform ).xyz;
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float2 node_2315 = (mul( UNITY_MATRIX_V, float4(node_8069.rgb,0) ).xyz.rgb.rg*0.5+0.5);
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_2315, _Matcap));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = (((attenuation*_ShadowPow_var)*((_Albedo_var.rgb*_AlbedoPow_var)+(dot(node_8069.rgb,halfDirection)*_SpecPow_var)))+((_Matcap_var.rgb*pow(1.0-max(0,dot(node_8069.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var));
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
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _ShadowPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _AlbedoPow)
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
