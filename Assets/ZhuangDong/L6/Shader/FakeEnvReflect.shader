// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4960,x:33061,y:32781,varname:node_4960,prsc:2|emission-1219-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:3989,x:31569,y:32694,varname:node_3989,prsc:2;n:type:ShaderForge.SFN_LightVector,id:1579,x:31569,y:32552,varname:node_1579,prsc:2;n:type:ShaderForge.SFN_Dot,id:4692,x:31797,y:32631,varname:node_4692,prsc:2,dt:0|A-1579-OUT,B-3989-OUT;n:type:ShaderForge.SFN_RemapRange,id:6834,x:31978,y:32631,varname:node_6834,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4692-OUT;n:type:ShaderForge.SFN_Append,id:6892,x:32226,y:32663,varname:node_6892,prsc:2|A-6834-OUT,B-3643-OUT;n:type:ShaderForge.SFN_Slider,id:3643,x:31821,y:32835,ptovrint:False,ptlb:TexType,ptin:_TexType,varname:node_3643,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:3738,x:32385,y:32663,ptovrint:False,ptlb:Tex,ptin:_Tex,varname:node_3738,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:2,isnm:False|UVIN-6892-OUT;n:type:ShaderForge.SFN_Multiply,id:9722,x:32614,y:32820,varname:node_9722,prsc:2|A-3738-RGB,B-565-OUT;n:type:ShaderForge.SFN_Slider,id:565,x:32185,y:32881,ptovrint:False,ptlb:EnvReflect,ptin:_EnvReflect,varname:node_565,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2434783,max:1;n:type:ShaderForge.SFN_Power,id:3133,x:32518,y:33017,varname:node_3133,prsc:2|VAL-1421-OUT,EXP-710-OUT;n:type:ShaderForge.SFN_Slider,id:710,x:32126,y:33153,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:node_710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:20;n:type:ShaderForge.SFN_Max,id:1421,x:32126,y:32998,varname:node_1421,prsc:2|A-4692-OUT,B-284-OUT;n:type:ShaderForge.SFN_Vector1,id:284,x:31930,y:33050,varname:node_284,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:1219,x:32802,y:32887,cmnt:这个效果需要复杂表面,varname:node_1219,prsc:2|A-9722-OUT,B-3133-OUT;proporder:3643-3738-565-710;pass:END;sub:END;*/

Shader "ZD/L6/FakeEnvReflect" {
    Properties {
        _TexType ("TexType", Range(0, 1)) = 0
        _Tex ("Tex", 2D) = "black" {}
        _EnvReflect ("EnvReflect", Range(0, 1)) = 0.2434783
        _SpecularPow ("SpecularPow", Range(0, 20)) = 2
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _TexType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvReflect)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_4692 = dot(lightDirection,viewReflectDirection);
                float _TexType_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TexType );
                float2 node_6892 = float2((node_4692*0.5+0.5),_TexType_var);
                float4 _Tex_var = tex2D(_Tex,TRANSFORM_TEX(node_6892, _Tex));
                float _EnvReflect_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvReflect );
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float3 emissive = ((_Tex_var.rgb*_EnvReflect_var)+pow(max(node_4692,0.0),_SpecularPow_var));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _TexType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvReflect)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
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
