// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:6576,x:32719,y:32712,varname:node_6576,prsc:2|emission-1067-OUT;n:type:ShaderForge.SFN_NormalVector,id:2260,x:31203,y:32370,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:2552,x:31208,y:32535,varname:node_2552,prsc:2;n:type:ShaderForge.SFN_Dot,id:1701,x:31405,y:32422,varname:node_1701,prsc:2,dt:0|A-2260-OUT,B-2552-OUT;n:type:ShaderForge.SFN_Multiply,id:2130,x:31631,y:32432,varname:node_2130,prsc:2|A-1701-OUT,B-9714-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9714,x:31405,y:32672,ptovrint:False,ptlb:node_9714,ptin:_node_9714,varname:node_9714,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Add,id:1856,x:31789,y:32536,varname:node_1856,prsc:2|A-2130-OUT,B-9714-OUT;n:type:ShaderForge.SFN_Append,id:3045,x:31947,y:32648,varname:node_3045,prsc:2|A-1856-OUT,B-9714-OUT;n:type:ShaderForge.SFN_Tex2d,id:59,x:32121,y:32648,ptovrint:False,ptlb:tex,ptin:_tex,varname:node_59,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:da2a2d768b3b3904bad6dc54c4c5f2ac,ntxv:0,isnm:False|UVIN-3045-OUT;n:type:ShaderForge.SFN_NormalVector,id:6449,x:30829,y:32910,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3105,x:30835,y:32779,varname:node_3105,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:7109,x:30829,y:33096,ptovrint:False,ptlb:Offest1,ptin:_Offest1,varname:node_7109,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:5348,x:31099,y:33024,varname:node_5348,prsc:2|A-3105-OUT,B-7109-XYZ;n:type:ShaderForge.SFN_Normalize,id:6409,x:31293,y:33024,varname:node_6409,prsc:2|IN-5348-OUT;n:type:ShaderForge.SFN_If,id:5766,x:31783,y:33056,varname:node_5766,prsc:2|A-9377-OUT,B-5942-OUT,GT-6587-OUT,EQ-1538-OUT,LT-1538-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5942,x:31481,y:33042,ptovrint:False,ptlb:rate,ptin:_rate,varname:node_5942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.8;n:type:ShaderForge.SFN_ValueProperty,id:6587,x:31481,y:33126,ptovrint:False,ptlb:white,ptin:_white,varname:_node_5942_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1538,x:31481,y:33221,ptovrint:False,ptlb:black,ptin:_black,varname:_node_5942_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1067,x:32471,y:32753,varname:node_1067,prsc:2|A-59-RGB,B-2024-OUT;n:type:ShaderForge.SFN_Dot,id:9377,x:31467,y:32834,varname:node_9377,prsc:2,dt:0|A-6449-OUT,B-6409-OUT;n:type:ShaderForge.SFN_Add,id:7756,x:31102,y:33370,varname:node_7756,prsc:2|A-3105-OUT,B-6248-XYZ;n:type:ShaderForge.SFN_Normalize,id:9641,x:31286,y:33370,varname:node_9641,prsc:2|IN-7756-OUT;n:type:ShaderForge.SFN_If,id:4043,x:31794,y:33329,varname:node_4043,prsc:2|A-175-OUT,B-5942-OUT,GT-6587-OUT,EQ-1538-OUT,LT-1538-OUT;n:type:ShaderForge.SFN_Dot,id:175,x:31509,y:33329,varname:node_175,prsc:2,dt:0|A-6449-OUT,B-9641-OUT;n:type:ShaderForge.SFN_Max,id:2024,x:32084,y:33146,varname:node_2024,prsc:2|A-5766-OUT,B-4043-OUT;n:type:ShaderForge.SFN_Vector4Property,id:6248,x:30829,y:33347,ptovrint:False,ptlb:Offest2,ptin:_Offest2,varname:node_6248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_InverseLerp,id:8883,x:31012,y:33519,varname:node_8883,prsc:2;proporder:9714-59-7109-5942-6587-1538-6248;pass:END;sub:END;*/

Shader "Unlit/Nephrite" {
    Properties {
        _node_9714 ("node_9714", Float ) = 0.5
        _tex ("tex", 2D) = "white" {}
        _Offest1 ("Offest1", Vector) = (0,0,0,0)
        _rate ("rate", Float ) = 0.8
        _white ("white", Float ) = 1
        _black ("black", Float ) = 0
        _Offest2 ("Offest2", Vector) = (0,0,0,0)
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
            uniform sampler2D _tex; uniform float4 _tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_9714)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest1)
                UNITY_DEFINE_INSTANCED_PROP( float, _rate)
                UNITY_DEFINE_INSTANCED_PROP( float, _white)
                UNITY_DEFINE_INSTANCED_PROP( float, _black)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest2)
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float _node_9714_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_9714 );
                float2 node_3045 = float2(((dot(i.normalDir,lightDirection)*_node_9714_var)+_node_9714_var),_node_9714_var);
                float4 _tex_var = tex2D(_tex,TRANSFORM_TEX(node_3045, _tex));
                float4 _Offest1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Offest1 );
                float _rate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _rate );
                float node_5766_if_leA = step(dot(i.normalDir,normalize((lightDirection+_Offest1_var.rgb))),_rate_var);
                float node_5766_if_leB = step(_rate_var,dot(i.normalDir,normalize((lightDirection+_Offest1_var.rgb))));
                float _black_var = UNITY_ACCESS_INSTANCED_PROP( Props, _black );
                float _white_var = UNITY_ACCESS_INSTANCED_PROP( Props, _white );
                float4 _Offest2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Offest2 );
                float node_4043_if_leA = step(dot(i.normalDir,normalize((lightDirection+_Offest2_var.rgb))),_rate_var);
                float node_4043_if_leB = step(_rate_var,dot(i.normalDir,normalize((lightDirection+_Offest2_var.rgb))));
                float3 emissive = (_tex_var.rgb+max(lerp((node_5766_if_leA*_black_var)+(node_5766_if_leB*_white_var),_black_var,node_5766_if_leA*node_5766_if_leB),lerp((node_4043_if_leA*_black_var)+(node_4043_if_leB*_white_var),_black_var,node_4043_if_leA*node_4043_if_leB)));
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
            uniform sampler2D _tex; uniform float4 _tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_9714)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest1)
                UNITY_DEFINE_INSTANCED_PROP( float, _rate)
                UNITY_DEFINE_INSTANCED_PROP( float, _white)
                UNITY_DEFINE_INSTANCED_PROP( float, _black)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest2)
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
                float3 normalDirection = i.normalDir;
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
