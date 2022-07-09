// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3600,x:32707,y:32656,varname:node_3600,prsc:2|emission-1785-OUT;n:type:ShaderForge.SFN_Code,id:6733,x:31709,y:32796,varname:node_6733,prsc:2,code:ZgBsAG8AYQB0ADMAIABuAEQAaQByAFQAUwAgAD0AIABVAG4AcABhAGMAawBOAG8AcgBtAGEAbAAoAHQAZQB4ADIARAAoAG4AbwByAG0AYQBsAE0AYQBwACwAIAB1AHYAKQApADsACgBmAGwAbwBhAHQAMwB4ADMAIABUAEIATgAgAD0AIABmAGwAbwBhAHQAMwB4ADMAKAB0AEQAaQByACwAIABiAEQAaQByACwAIABuAEQAaQByACkAOwAKAGYAbABvAGEAdAAzACAAbgBEAGkAcgBXAFMAIAA9ACAAbgBvAHIAbQBhAGwAaQB6AGUAKABtAHUAbAAoAG4ARABpAHIAVABTACwAIABUAEIATgApACkAOwAKAHIAZQB0AHUAcgBuACAAbgBEAGkAcgBXAFMAOwA=,output:2,fname:nDirTSTonDirWS,width:531,height:148,input:2,input:2,input:2,input:12,input:1,input_1_label:tDir,input_2_label:bDir,input_3_label:nDir,input_4_label:normalMap,input_5_label:uv|A-3743-OUT,B-7068-OUT,C-5497-OUT,D-7391-TEX,E-6578-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7391,x:31403,y:32862,ptovrint:False,ptlb:normalMap,ptin:_normalMap,varname:node_7391,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:663e730a277c3e0419c4aa4792d9fca8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_TexCoord,id:6578,x:31403,y:33021,varname:node_6578,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_LightVector,id:6785,x:32141,y:32641,varname:node_6785,prsc:2;n:type:ShaderForge.SFN_Dot,id:2741,x:32308,y:32731,varname:node_2741,prsc:2,dt:0|A-6785-OUT,B-6733-OUT;n:type:ShaderForge.SFN_Max,id:1785,x:32484,y:32731,varname:node_1785,prsc:2|A-2741-OUT,B-6673-OUT;n:type:ShaderForge.SFN_Vector1,id:6673,x:32308,y:32875,varname:node_6673,prsc:2,v1:0;n:type:ShaderForge.SFN_Bitangent,id:7068,x:31403,y:32569,varname:node_7068,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5497,x:31403,y:32696,prsc:2,pt:True;n:type:ShaderForge.SFN_Tangent,id:3743,x:31403,y:32447,varname:node_3743,prsc:2;proporder:7391;pass:END;sub:END;*/

Shader "ZD/L08/normalMap" {
    Properties {
        _normalMap ("normalMap", 2D) = "bump" {}
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            float3 nDirTSTonDirWS( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap, uv));
            float3x3 TBN = float3x3(tDir, bDir, nDir);
            float3 nDirWS = normalize(mul(nDirTS, TBN));
            return nDirWS;
            }
            
            uniform sampler2D _normalMap; uniform float4 _normalMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
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
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_1785 = max(dot(lightDirection,nDirTSTonDirWS( i.tangentDir , i.bitangentDir , normalDirection , _normalMap , i.uv0 )),0.0);
                float3 emissive = float3(node_1785,node_1785,node_1785);
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            float3 nDirTSTonDirWS( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap, uv));
            float3x3 TBN = float3x3(tDir, bDir, nDir);
            float3 nDirWS = normalize(mul(nDirTS, TBN));
            return nDirWS;
            }
            
            uniform sampler2D _normalMap; uniform float4 _normalMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
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
