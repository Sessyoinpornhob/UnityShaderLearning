// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:6576,x:32719,y:32712,varname:node_6576,prsc:2|emission-4644-OUT;n:type:ShaderForge.SFN_NormalVector,id:2260,x:31213,y:32025,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:2552,x:31218,y:32190,varname:node_2552,prsc:2;n:type:ShaderForge.SFN_Dot,id:1701,x:31415,y:32077,varname:node_1701,prsc:2,dt:0|A-2260-OUT,B-2552-OUT;n:type:ShaderForge.SFN_Multiply,id:2130,x:31641,y:32087,varname:node_2130,prsc:2|A-1701-OUT,B-9714-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9714,x:31415,y:32327,ptovrint:False,ptlb:noneed,ptin:_noneed,varname:node_9714,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Add,id:1856,x:31799,y:32191,varname:node_1856,prsc:2|A-2130-OUT,B-9714-OUT;n:type:ShaderForge.SFN_Append,id:3045,x:31957,y:32303,varname:node_3045,prsc:2|A-1856-OUT,B-9714-OUT;n:type:ShaderForge.SFN_Tex2d,id:59,x:32131,y:32303,ptovrint:False,ptlb:texx,ptin:_texx,varname:node_59,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:da2a2d768b3b3904bad6dc54c4c5f2ac,ntxv:0,isnm:False|UVIN-3045-OUT;n:type:ShaderForge.SFN_NormalVector,id:6449,x:30687,y:32685,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3105,x:30693,y:32554,varname:node_3105,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:7109,x:30687,y:32871,ptovrint:False,ptlb:Offest1,ptin:_Offest1,varname:node_7109,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:5348,x:30957,y:32799,varname:node_5348,prsc:2|A-3105-OUT,B-7109-XYZ;n:type:ShaderForge.SFN_Normalize,id:6409,x:31151,y:32799,varname:node_6409,prsc:2|IN-5348-OUT;n:type:ShaderForge.SFN_If,id:5766,x:31914,y:32714,varname:node_5766,prsc:2|A-9377-OUT,B-2868-OUT,GT-6587-OUT,EQ-1538-OUT,LT-1538-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6587,x:31648,y:32767,ptovrint:False,ptlb:white,ptin:_white,varname:_node_5942_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1538,x:31648,y:32966,ptovrint:False,ptlb:black,ptin:_black,varname:_node_5942_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1067,x:32352,y:32537,varname:node_1067,prsc:2|A-59-RGB,B-2024-OUT;n:type:ShaderForge.SFN_Dot,id:9377,x:31325,y:32609,varname:node_9377,prsc:2,dt:0|A-6449-OUT,B-6409-OUT;n:type:ShaderForge.SFN_Add,id:7756,x:30960,y:33145,varname:node_7756,prsc:2|A-3105-OUT,B-6248-XYZ;n:type:ShaderForge.SFN_Normalize,id:9641,x:31144,y:33145,varname:node_9641,prsc:2|IN-7756-OUT;n:type:ShaderForge.SFN_If,id:4043,x:31914,y:32964,varname:node_4043,prsc:2|A-175-OUT,B-2868-OUT,GT-6587-OUT,EQ-1538-OUT,LT-1538-OUT;n:type:ShaderForge.SFN_Dot,id:175,x:31367,y:33104,varname:node_175,prsc:2,dt:0|A-6449-OUT,B-9641-OUT;n:type:ShaderForge.SFN_Max,id:2024,x:32133,y:32801,varname:node_2024,prsc:2|A-5766-OUT,B-4043-OUT;n:type:ShaderForge.SFN_Vector4Property,id:6248,x:30687,y:33122,ptovrint:False,ptlb:Offest2,ptin:_Offest2,varname:node_6248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Slider,id:2868,x:31455,y:32861,ptovrint:False,ptlb:rate,ptin:_rate,varname:node_2868,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.95,cur:0.9802076,max:1;n:type:ShaderForge.SFN_Fresnel,id:9452,x:32182,y:33306,varname:node_9452,prsc:2|EXP-2181-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2181,x:32008,y:33330,ptovrint:False,ptlb:Frate,ptin:_Frate,varname:node_2181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Color,id:659,x:32130,y:33455,ptovrint:False,ptlb:Fcolor,ptin:_Fcolor,varname:node_659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.450801,c2:0.5943396,c3:0.5280563,c4:1;n:type:ShaderForge.SFN_Multiply,id:3440,x:32368,y:33362,varname:node_3440,prsc:2|A-9452-OUT,B-659-RGB;n:type:ShaderForge.SFN_Blend,id:4644,x:32557,y:32823,varname:node_4644,prsc:2,blmd:6,clmp:True|SRC-1067-OUT,DST-3440-OUT;proporder:59-7109-6248-6587-1538-2868-2181-659-9714;pass:END;sub:END;*/

Shader "ZD/L01/Nephrite" {
    Properties {
        _texx ("texx", 2D) = "white" {}
        _Offest1 ("Offest1", Vector) = (0,0,0,0)
        _Offest2 ("Offest2", Vector) = (0,0,0,0)
        _white ("white", Float ) = 1
        _black ("black", Float ) = 0
        _rate ("rate", Range(0.95, 1)) = 0.9802076
        _Frate ("Frate", Float ) = 5
        _Fcolor ("Fcolor", Color) = (0.450801,0.5943396,0.5280563,1)
        _noneed ("noneed", Float ) = 0.5
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
            uniform sampler2D _texx; uniform float4 _texx_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _noneed)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest1)
                UNITY_DEFINE_INSTANCED_PROP( float, _white)
                UNITY_DEFINE_INSTANCED_PROP( float, _black)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest2)
                UNITY_DEFINE_INSTANCED_PROP( float, _rate)
                UNITY_DEFINE_INSTANCED_PROP( float, _Frate)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Fcolor)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float _noneed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _noneed );
                float2 node_3045 = float2(((dot(i.normalDir,lightDirection)*_noneed_var)+_noneed_var),_noneed_var);
                float4 _texx_var = tex2D(_texx,TRANSFORM_TEX(node_3045, _texx));
                float4 _Offest1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Offest1 );
                float _rate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _rate );
                float node_5766_if_leA = step(dot(i.normalDir,normalize((lightDirection+_Offest1_var.rgb))),_rate_var);
                float node_5766_if_leB = step(_rate_var,dot(i.normalDir,normalize((lightDirection+_Offest1_var.rgb))));
                float _black_var = UNITY_ACCESS_INSTANCED_PROP( Props, _black );
                float _white_var = UNITY_ACCESS_INSTANCED_PROP( Props, _white );
                float4 _Offest2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Offest2 );
                float node_4043_if_leA = step(dot(i.normalDir,normalize((lightDirection+_Offest2_var.rgb))),_rate_var);
                float node_4043_if_leB = step(_rate_var,dot(i.normalDir,normalize((lightDirection+_Offest2_var.rgb))));
                float _Frate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Frate );
                float4 _Fcolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Fcolor );
                float3 emissive = saturate((1.0-(1.0-(_texx_var.rgb+max(lerp((node_5766_if_leA*_black_var)+(node_5766_if_leB*_white_var),_black_var,node_5766_if_leA*node_5766_if_leB),lerp((node_4043_if_leA*_black_var)+(node_4043_if_leB*_white_var),_black_var,node_4043_if_leA*node_4043_if_leB))))*(1.0-(pow(1.0-max(0,dot(normalDirection, viewDirection)),_Frate_var)*_Fcolor_var.rgb))));
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
            uniform sampler2D _texx; uniform float4 _texx_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _noneed)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest1)
                UNITY_DEFINE_INSTANCED_PROP( float, _white)
                UNITY_DEFINE_INSTANCED_PROP( float, _black)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Offest2)
                UNITY_DEFINE_INSTANCED_PROP( float, _rate)
                UNITY_DEFINE_INSTANCED_PROP( float, _Frate)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Fcolor)
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
