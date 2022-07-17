// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:383,x:33046,y:32607,varname:node_383,prsc:2|emission-1936-OUT;n:type:ShaderForge.SFN_NormalVector,id:7348,x:31679,y:32876,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:395,x:31860,y:32876,varname:node_395,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-7348-OUT;n:type:ShaderForge.SFN_Max,id:992,x:32068,y:32921,cmnt:向上部分遮罩,varname:node_992,prsc:2|A-395-OUT,B-8252-OUT;n:type:ShaderForge.SFN_Vector1,id:8252,x:31860,y:33031,varname:node_8252,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6569,x:31860,y:33111,varname:node_6569,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:8225,x:32030,y:33111,varname:node_8225,prsc:2|A-395-OUT,B-6569-OUT;n:type:ShaderForge.SFN_Max,id:2684,x:32196,y:33070,cmnt:向下部分遮罩,varname:node_2684,prsc:2|A-8252-OUT,B-8225-OUT;n:type:ShaderForge.SFN_Vector1,id:7082,x:32068,y:32824,varname:node_7082,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:4073,x:32235,y:32892,varname:node_4073,prsc:2|A-7082-OUT,B-992-OUT;n:type:ShaderForge.SFN_Subtract,id:4078,x:32414,y:32984,cmnt:侧方向遮罩,varname:node_4078,prsc:2|A-4073-OUT,B-2684-OUT;n:type:ShaderForge.SFN_Color,id:6652,x:32068,y:32316,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_6652,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:758,x:32068,y:32495,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_EnvUpCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:6434,x:32068,y:32667,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_EnvUpCol_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2707,x:32410,y:32321,varname:node_2707,prsc:2|A-6652-RGB,B-992-OUT;n:type:ShaderForge.SFN_Multiply,id:2854,x:32410,y:32496,varname:node_2854,prsc:2|A-758-RGB,B-4078-OUT;n:type:ShaderForge.SFN_Multiply,id:9696,x:32410,y:32678,varname:node_9696,prsc:2|A-6434-RGB,B-2684-OUT;n:type:ShaderForge.SFN_Add,id:8805,x:32652,y:32521,varname:node_8805,prsc:2|A-2707-OUT,B-2854-OUT,C-9696-OUT;n:type:ShaderForge.SFN_Multiply,id:1936,x:32875,y:32607,varname:node_1936,prsc:2|A-8805-OUT,B-3946-RGB;n:type:ShaderForge.SFN_Tex2d,id:3946,x:32704,y:32709,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_3946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:047f9a23aa5dd9c4f8cb39b70d9ff517,ntxv:0,isnm:False;proporder:6652-758-6434-3946;pass:END;sub:END;*/

Shader "ZD/L07/3ColAmbient" {
    Properties {
        _EnvUpCol ("EnvUpCol", Color) = (0.5,0.5,0.5,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.5,0.5,0.5,1)
        _AO ("AO", 2D) = "white" {}
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
            uniform sampler2D _AO; uniform float4 _AO_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
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
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_395 = i.normalDir.g;
                float node_8252 = 0.0;
                float node_992 = max(node_395,node_8252); // 向上部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float node_2684 = max(node_8252,(node_395*(-1.0))); // 向下部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float3 emissive = (((_EnvUpCol_var.rgb*node_992)+(_EnvSideCol_var.rgb*((1.0-node_992)-node_2684))+(_EnvDownCol_var.rgb*node_2684))*_AO_var.rgb);
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
