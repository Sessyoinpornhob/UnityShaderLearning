// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:136,x:32719,y:32712,varname:node_136,prsc:2|emission-5814-OUT;n:type:ShaderForge.SFN_Vector4Property,id:6710,x:31396,y:32613,ptovrint:False,ptlb:lDir伪造光方向,ptin:_lDir,varname:node_6710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Normalize,id:2498,x:31584,y:32613,varname:node_2498,prsc:2|IN-6710-XYZ;n:type:ShaderForge.SFN_NormalVector,id:6007,x:31584,y:32776,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:9234,x:31792,y:32664,varname:node_9234,prsc:2,dt:0|A-2498-OUT,B-6007-OUT;n:type:ShaderForge.SFN_RemapRange,id:3577,x:31992,y:32664,varname:node_3577,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9234-OUT;n:type:ShaderForge.SFN_Color,id:5089,x:31325,y:33027,ptovrint:False,ptlb:lColor伪造光色,ptin:_lColor,varname:node_5089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2173,x:31616,y:32974,varname:node_2173,prsc:2|A-3577-OUT,B-5089-RGB;n:type:ShaderForge.SFN_Slider,id:3529,x:31487,y:33151,ptovrint:False,ptlb:lStrengh伪造光强度,ptin:_lStrengh,varname:node_3529,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:2583,x:31850,y:33012,varname:node_2583,prsc:2|A-2173-OUT,B-3529-OUT;n:type:ShaderForge.SFN_Tex2d,id:633,x:31756,y:33275,ptovrint:False,ptlb:Tex需求材质,ptin:_Tex,varname:node_633,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:da2a2d768b3b3904bad6dc54c4c5f2ac,ntxv:0,isnm:False|UVIN-785-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:785,x:31561,y:33275,varname:node_785,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7408,x:32049,y:33121,varname:node_7408,prsc:2|A-2583-OUT,B-633-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:5814,x:32363,y:33104,ptovrint:False,ptlb:应用光照,ptin:_,varname:node_5814,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-633-RGB,B-7408-OUT;proporder:6710-5089-3529-633-5814;pass:END;sub:END;*/

Shader "ZD/L3/FakeLight" {
    Properties {
        _lDir ("lDir伪造光方向", Vector) = (0,0,0,0)
        _lColor ("lColor伪造光色", Color) = (0.5,0.5,0.5,1)
        _lStrengh ("lStrengh伪造光强度", Range(0, 10)) = 0
        _Tex ("Tex需求材质", 2D) = "white" {}
        [MaterialToggle] _ ("应用光照", Float ) = 0
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
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _lDir)
                UNITY_DEFINE_INSTANCED_PROP( float4, _lColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _lStrengh)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _)
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
                float4 _Tex_var = tex2D(_Tex,TRANSFORM_TEX(i.uv0, _Tex));
                float4 _lDir_var = UNITY_ACCESS_INSTANCED_PROP( Props, _lDir );
                float4 _lColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _lColor );
                float _lStrengh_var = UNITY_ACCESS_INSTANCED_PROP( Props, _lStrengh );
                float3 __var = lerp( _Tex_var.rgb, ((((dot(normalize(_lDir_var.rgb),i.normalDir)*0.5+0.5)*_lColor_var.rgb)*_lStrengh_var)*_Tex_var.rgb), UNITY_ACCESS_INSTANCED_PROP( Props, _ ) );
                float3 emissive = __var;
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
