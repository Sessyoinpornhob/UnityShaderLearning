// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2961,x:32584,y:32688,varname:node_2961,prsc:2|emission-8237-OUT;n:type:ShaderForge.SFN_LightVector,id:9221,x:31350,y:32679,varname:node_9221,prsc:2;n:type:ShaderForge.SFN_Dot,id:558,x:31590,y:32504,varname:node_558,prsc:2,dt:0|A-9421-OUT,B-9221-OUT;n:type:ShaderForge.SFN_Dot,id:502,x:31571,y:32778,varname:node_502,prsc:2,dt:0|A-9221-OUT,B-1786-OUT;n:type:ShaderForge.SFN_NormalVector,id:1786,x:31350,y:32816,prsc:2,pt:False;n:type:ShaderForge.SFN_Power,id:4054,x:32103,y:32654,varname:node_4054,prsc:2|VAL-4339-OUT,EXP-1336-OUT;n:type:ShaderForge.SFN_Tex2d,id:1242,x:30831,y:32698,ptovrint:False,ptlb:NoiseTex,ptin:_NoiseTex,varname:node_1242,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:3760,x:31095,y:32763,varname:node_3760,prsc:2|A-1242-RGB,B-3270-OUT;n:type:ShaderForge.SFN_Slider,id:3270,x:30752,y:32890,ptovrint:False,ptlb:RustRange,ptin:_RustRange,varname:node_3270,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4307941,max:1;n:type:ShaderForge.SFN_Color,id:6330,x:31442,y:32988,ptovrint:False,ptlb:IronColor,ptin:_IronColor,varname:node_6330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5849056,c2:0.5849056,c3:0.5849056,c4:1;n:type:ShaderForge.SFN_Color,id:8965,x:31442,y:33160,ptovrint:False,ptlb:RustColor,ptin:_RustColor,varname:node_8965,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3301887,c2:0.1506125,c3:0.0448558,c4:1;n:type:ShaderForge.SFN_Multiply,id:3849,x:32073,y:32871,varname:node_3849,prsc:2|A-9947-OUT,B-4307-OUT;n:type:ShaderForge.SFN_Max,id:9947,x:31840,y:32775,varname:node_9947,prsc:2|A-502-OUT,B-1623-OUT;n:type:ShaderForge.SFN_Vector1,id:1623,x:31625,y:32712,varname:node_1623,prsc:2,v1:0;n:type:ShaderForge.SFN_ViewReflectionVector,id:9421,x:31348,y:32476,varname:node_9421,prsc:2;n:type:ShaderForge.SFN_Max,id:4339,x:31840,y:32542,varname:node_4339,prsc:2|A-558-OUT,B-1623-OUT;n:type:ShaderForge.SFN_Add,id:8237,x:32363,y:32785,varname:node_8237,prsc:2|A-4054-OUT,B-3849-OUT;n:type:ShaderForge.SFN_Slider,id:1027,x:31283,y:32277,ptovrint:False,ptlb:SpecularPow1,ptin:_SpecularPow1,varname:node_8506,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:30,cur:62.87922,max:100;n:type:ShaderForge.SFN_Slider,id:8819,x:31283,y:32373,ptovrint:False,ptlb:SpecularPow2,ptin:_SpecularPow2,varname:_SpecularPow2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:100,cur:200,max:200;n:type:ShaderForge.SFN_Lerp,id:1336,x:31800,y:32323,varname:node_1336,prsc:2|A-1027-OUT,B-8819-OUT,T-3760-OUT;n:type:ShaderForge.SFN_Lerp,id:4307,x:31756,y:33034,varname:node_4307,prsc:2|A-6330-RGB,B-8965-RGB,T-3760-OUT;proporder:6330-1242-3270-8965-1027-8819;pass:END;sub:END;*/

Shader "ZD/L06/Rust" {
    Properties {
        _IronColor ("IronColor", Color) = (0.5849056,0.5849056,0.5849056,1)
        _NoiseTex ("NoiseTex", 2D) = "white" {}
        _RustRange ("RustRange", Range(0, 1)) = 0.4307941
        _RustColor ("RustColor", Color) = (0.3301887,0.1506125,0.0448558,1)
        _SpecularPow1 ("SpecularPow1", Range(30, 100)) = 62.87922
        _SpecularPow2 ("SpecularPow2", Range(100, 200)) = 200
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
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RustRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _IronColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _RustColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
                float node_1623 = 0.0;
                float _SpecularPow1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow1 );
                float _SpecularPow2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow2 );
                float4 _NoiseTex_var = tex2D(_NoiseTex,TRANSFORM_TEX(i.uv0, _NoiseTex));
                float _RustRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RustRange );
                float3 node_3760 = step(_NoiseTex_var.rgb,_RustRange_var);
                float4 _IronColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _IronColor );
                float4 _RustColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RustColor );
                float3 emissive = (pow(max(dot(viewReflectDirection,lightDirection),node_1623),lerp(float3(_SpecularPow1_var,_SpecularPow1_var,_SpecularPow1_var),float3(_SpecularPow2_var,_SpecularPow2_var,_SpecularPow2_var),node_3760))+(max(dot(lightDirection,i.normalDir),node_1623)*lerp(_IronColor_var.rgb,_RustColor_var.rgb,node_3760)));
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
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RustRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _IronColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _RustColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
