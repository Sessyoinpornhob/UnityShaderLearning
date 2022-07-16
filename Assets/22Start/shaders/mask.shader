// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:8468,x:32856,y:32720,varname:node_8468,prsc:2|emission-4979-OUT;n:type:ShaderForge.SFN_Tex2d,id:2405,x:31976,y:32743,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_2405,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9bc414e0072124b4bab82dbd79e9bc37,ntxv:2,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:1399,x:32199,y:32812,varname:node_1399,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-2405-RGB;n:type:ShaderForge.SFN_Multiply,id:8117,x:32492,y:32743,varname:node_8117,prsc:2|A-4934-RGB,B-1399-OUT;n:type:ShaderForge.SFN_Tex2d,id:7937,x:32344,y:33043,ptovrint:False,ptlb:GreenTex,ptin:_GreenTex,varname:node_7937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5de0eafe0c281495b8272d9a1d7c3ea8,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4934,x:32313,y:32617,ptovrint:False,ptlb:RedTex,ptin:_RedTex,varname:node_4934,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dffef66376be4fa480fb02b19edbe903,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:724,x:32199,y:32972,varname:node_724,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2405-RGB;n:type:ShaderForge.SFN_Multiply,id:5965,x:32505,y:32953,varname:node_5965,prsc:2|A-724-OUT,B-7937-RGB;n:type:ShaderForge.SFN_Add,id:4979,x:32655,y:32853,varname:node_4979,prsc:2|A-8117-OUT,B-5965-OUT;proporder:2405-4934-7937;pass:END;sub:END;*/

Shader "22/mask" {
    Properties {
        _mask ("mask", 2D) = "black" {}
        _RedTex ("RedTex", 2D) = "white" {}
        _GreenTex ("GreenTex", 2D) = "black" {}
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
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _GreenTex; uniform float4 _GreenTex_ST;
            uniform sampler2D _RedTex; uniform float4 _RedTex_ST;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _RedTex_var = tex2D(_RedTex,TRANSFORM_TEX(i.uv0, _RedTex));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 _GreenTex_var = tex2D(_GreenTex,TRANSFORM_TEX(i.uv0, _GreenTex));
                float3 emissive = ((_RedTex_var.rgb*_mask_var.rgb.r)+(_mask_var.rgb.g*_GreenTex_var.rgb));
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
