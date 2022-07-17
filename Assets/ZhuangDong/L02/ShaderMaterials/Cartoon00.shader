// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9395,x:32525,y:32643,varname:node_9395,prsc:2|emission-7847-OUT,olwid-4934-OUT,olcol-3066-RGB;n:type:ShaderForge.SFN_Depth,id:2447,x:31009,y:32485,varname:node_2447,prsc:2;n:type:ShaderForge.SFN_ScreenPos,id:1158,x:31009,y:32640,varname:node_1158,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:5378,x:31260,y:32552,varname:node_5378,prsc:2|A-2447-OUT,B-1158-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3908,x:31489,y:32572,ptovrint:False,ptlb:lines,ptin:_lines,varname:node_3908,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a65fdcbad7ee2d48a7126353dab8373,ntxv:0,isnm:False|UVIN-5378-OUT;n:type:ShaderForge.SFN_NormalVector,id:7937,x:31161,y:32890,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:4303,x:31161,y:33039,varname:node_4303,prsc:2;n:type:ShaderForge.SFN_Dot,id:9725,x:31350,y:32890,varname:node_9725,prsc:2,dt:0|A-7937-OUT,B-4303-OUT;n:type:ShaderForge.SFN_Step,id:5619,x:31750,y:32700,varname:node_5619,prsc:2|A-3908-RGB,B-6172-OUT;n:type:ShaderForge.SFN_Slider,id:1656,x:31366,y:33065,ptovrint:False,ptlb:DarkArea,ptin:_DarkArea,varname:node_1656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:6172,x:31588,y:32865,varname:node_6172,prsc:2|A-9725-OUT,B-1656-OUT;n:type:ShaderForge.SFN_Color,id:5061,x:31750,y:32309,ptovrint:False,ptlb:DarkColor,ptin:_DarkColor,varname:node_5061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:8024,x:31750,y:32493,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:_DarkColor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:4711,x:31997,y:32649,varname:node_4711,prsc:2|A-5061-RGB,B-8024-RGB,T-5619-OUT;n:type:ShaderForge.SFN_Color,id:4443,x:31790,y:33022,ptovrint:False,ptlb:LambertColor,ptin:_LambertColor,varname:node_4443,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1064,x:31978,y:32860,varname:node_1064,prsc:2|A-6172-OUT,B-4443-RGB;n:type:ShaderForge.SFN_Add,id:7847,x:32270,y:32735,varname:node_7847,prsc:2|A-4711-OUT,B-1064-OUT;n:type:ShaderForge.SFN_Color,id:3066,x:32262,y:33051,ptovrint:False,ptlb:OutLineColor,ptin:_OutLineColor,varname:node_3066,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:4934,x:32184,y:32937,ptovrint:False,ptlb:OutLineWidth,ptin:_OutLineWidth,varname:node_4934,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.1;proporder:3908-1656-5061-8024-4443-4934-3066;pass:END;sub:END;*/

Shader "ZD/L02/Cartoon00" {
    Properties {
        _lines ("lines", 2D) = "white" {}
        _DarkArea ("DarkArea", Range(0, 1)) = 0
        _DarkColor ("DarkColor", Color) = (0.5,0.5,0.5,1)
        _LightColor ("LightColor", Color) = (0.5,0.5,0.5,1)
        _LambertColor ("LambertColor", Color) = (0.5,0.5,0.5,1)
        _OutLineWidth ("OutLineWidth", Range(0, 0.1)) = 0
        _OutLineColor ("OutLineColor", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _OutLineColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _OutLineWidth)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _OutLineWidth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutLineWidth );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_OutLineWidth_var,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _OutLineColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutLineColor );
                return fixed4(_OutLineColor_var.rgb,0);
            }
            ENDCG
        }
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
            uniform sampler2D _lines; uniform float4 _lines_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _DarkArea)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LambertColor)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _DarkColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkColor );
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float2 node_5378 = (partZ*(sceneUVs * 2 - 1).rg);
                float4 _lines_var = tex2D(_lines,TRANSFORM_TEX(node_5378, _lines));
                float _DarkArea_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkArea );
                float node_6172 = (dot(i.normalDir,lightDirection)+_DarkArea_var);
                float4 _LambertColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LambertColor );
                float3 emissive = (lerp(_DarkColor_var.rgb,_LightColor_var.rgb,step(_lines_var.rgb,node_6172))+(node_6172*_LambertColor_var.rgb));
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
            uniform sampler2D _lines; uniform float4 _lines_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _DarkArea)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LambertColor)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
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
