// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:5250,x:32981,y:32645,varname:node_5250,prsc:2|emission-5179-OUT;n:type:ShaderForge.SFN_Tex2d,id:3976,x:31797,y:32764,ptovrint:False,ptlb:Normalmap,ptin:_Normalmap,varname:node_3976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:06e1a8d669ca7304eb93a06fdd195314,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:4470,x:31977,y:32764,varname:node_4470,prsc:2,tffrom:2,tfto:0|IN-3976-RGB;n:type:ShaderForge.SFN_Fresnel,id:4456,x:32195,y:32764,varname:node_4456,prsc:2|NRM-4470-XYZ,EXP-1201-OUT;n:type:ShaderForge.SFN_Slider,id:1201,x:31977,y:32963,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_1201,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3826087,max:2;n:type:ShaderForge.SFN_ViewVector,id:7521,x:31797,y:32574,varname:node_7521,prsc:2;n:type:ShaderForge.SFN_Multiply,id:473,x:31987,y:32574,varname:node_473,prsc:2|A-7521-OUT,B-9682-OUT;n:type:ShaderForge.SFN_Vector1,id:9682,x:31797,y:32695,varname:node_9682,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:741,x:32195,y:32574,varname:node_741,prsc:2|A-473-OUT,B-4470-XYZ;n:type:ShaderForge.SFN_Cubemap,id:1843,x:32387,y:32574,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_1843,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:c2ac07bc65cb4a448b4ae0dfdeaa250f,pvfc:0|DIR-741-OUT,MIP-9728-OUT;n:type:ShaderForge.SFN_Multiply,id:7186,x:32602,y:32730,varname:node_7186,prsc:2|A-1843-RGB,B-4456-OUT;n:type:ShaderForge.SFN_Slider,id:9728,x:32169,y:32413,ptovrint:False,ptlb:CubeMapLOD,ptin:_CubeMapLOD,varname:node_9728,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:2,max:6;n:type:ShaderForge.SFN_Multiply,id:5179,x:32805,y:32792,varname:node_5179,prsc:2|A-7186-OUT,B-9618-OUT;n:type:ShaderForge.SFN_Slider,id:9618,x:32445,y:32896,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_9618,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:7;proporder:3976-1201-1843-9728-9618;pass:END;sub:END;*/

Shader "ZD/L09/Cubemap" {
    Properties {
        _Normalmap ("Normalmap", 2D) = "bump" {}
        _FresnelPow ("FresnelPow", Range(0, 2)) = 0.3826087
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _CubeMapLOD ("CubeMapLOD", Range(1, 6)) = 2
        _EnvSpecInt ("EnvSpecInt", Range(0, 7)) = 2
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            uniform samplerCUBE _CubeMap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubeMapLOD)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
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
                UNITY_FOG_COORDS(5)
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _Normalmap_var = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(i.uv0, _Normalmap)));
                float3 node_4470 = mul( _Normalmap_var.rgb, tangentTransform ).xyz;
                float _CubeMapLOD_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubeMapLOD );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((texCUBElod(_CubeMap,float4(reflect((viewDirection*(-1.0)),node_4470.rgb),_CubeMapLOD_var)).rgb*pow(1.0-max(0,dot(node_4470.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
