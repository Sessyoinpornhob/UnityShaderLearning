// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4025,x:32966,y:32811,varname:node_4025,prsc:2|emission-3397-OUT;n:type:ShaderForge.SFN_NormalVector,id:567,x:31283,y:32437,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7620,x:31283,y:32582,varname:node_7620,prsc:2;n:type:ShaderForge.SFN_Dot,id:3115,x:31490,y:32490,varname:node_3115,prsc:2,dt:0|A-567-OUT,B-7620-OUT;n:type:ShaderForge.SFN_Color,id:1685,x:31915,y:32314,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_1685,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5754717,c2:0.3982264,c3:0.3982264,c4:1;n:type:ShaderForge.SFN_Multiply,id:5337,x:31982,y:32519,cmnt:漫反射 Lambert,varname:node_5337,prsc:2|A-1685-RGB,B-4934-OUT;n:type:ShaderForge.SFN_Vector1,id:3008,x:31490,y:32634,varname:node_3008,prsc:2,v1:0;n:type:ShaderForge.SFN_NormalVector,id:3283,x:31286,y:32775,prsc:2,pt:False;n:type:ShaderForge.SFN_HalfVector,id:8902,x:31286,y:32947,varname:node_8902,prsc:2;n:type:ShaderForge.SFN_Dot,id:6061,x:31527,y:32859,varname:node_6061,prsc:2,dt:0|A-3283-OUT,B-8902-OUT;n:type:ShaderForge.SFN_Power,id:3642,x:31964,y:32814,cmnt:镜面反射 Blinn-Phong,varname:node_3642,prsc:2|VAL-217-OUT,EXP-3292-OUT;n:type:ShaderForge.SFN_Slider,id:3292,x:31795,y:33019,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_3292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:30,max:30;n:type:ShaderForge.SFN_Add,id:9789,x:32213,y:32564,varname:node_9789,prsc:2|A-5337-OUT,B-3642-OUT;n:type:ShaderForge.SFN_Max,id:217,x:31728,y:32804,varname:node_217,prsc:2|A-6381-OUT,B-6061-OUT;n:type:ShaderForge.SFN_Vector1,id:6381,x:31527,y:32785,varname:node_6381,prsc:2,v1:0;n:type:ShaderForge.SFN_NormalVector,id:2067,x:30539,y:33202,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:1227,x:30718,y:33202,varname:node_1227,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2067-OUT;n:type:ShaderForge.SFN_Max,id:1153,x:30898,y:33202,cmnt:上环境遮罩,varname:node_1153,prsc:2|A-1227-OUT,B-5209-OUT;n:type:ShaderForge.SFN_Vector1,id:5209,x:30718,y:33352,varname:node_5209,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:9634,x:30910,y:33421,varname:node_9634,prsc:2|A-1227-OUT,B-639-OUT;n:type:ShaderForge.SFN_Vector1,id:639,x:30718,y:33455,varname:node_639,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:7967,x:31092,y:33345,cmnt:下环境遮罩,varname:node_7967,prsc:2|A-5209-OUT,B-9634-OUT;n:type:ShaderForge.SFN_Subtract,id:4882,x:31129,y:33174,varname:node_4882,prsc:2|A-6192-OUT,B-1153-OUT;n:type:ShaderForge.SFN_Vector1,id:6192,x:30898,y:33093,varname:node_6192,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:1385,x:31334,y:33233,cmnt:四周环境遮罩,varname:node_1385,prsc:2|A-4882-OUT,B-7967-OUT;n:type:ShaderForge.SFN_Color,id:7000,x:31491,y:33146,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_7000,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:2560,x:31491,y:33473,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_2560,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:2189,x:31491,y:33314,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:node_2189,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1172,x:31826,y:33176,varname:node_1172,prsc:2|A-1153-OUT,B-7000-RGB;n:type:ShaderForge.SFN_Multiply,id:4784,x:31826,y:33314,varname:node_4784,prsc:2|A-1385-OUT,B-2189-RGB;n:type:ShaderForge.SFN_Multiply,id:3491,x:31826,y:33451,varname:node_3491,prsc:2|A-7967-OUT,B-2560-RGB;n:type:ShaderForge.SFN_Add,id:961,x:32046,y:33300,varname:node_961,prsc:2|A-1172-OUT,B-4784-OUT,C-3491-OUT;n:type:ShaderForge.SFN_Tex2d,id:1969,x:32298,y:32896,ptovrint:False,ptlb:AOMap,ptin:_AOMap,cmnt:环境遮挡,varname:node_1969,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:047f9a23aa5dd9c4f8cb39b70d9ff517,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3877,x:32546,y:32932,cmnt:环境部分结果,varname:node_3877,prsc:2|A-9206-OUT,B-1969-RGB;n:type:ShaderForge.SFN_LightAttenuation,id:6316,x:32213,y:32367,cmnt:光源遮挡,varname:node_6316,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5064,x:32446,y:32530,cmnt:光源结果,varname:node_5064,prsc:2|A-6316-OUT,B-9789-OUT;n:type:ShaderForge.SFN_Add,id:3397,x:32725,y:32786,varname:node_3397,prsc:2|A-5064-OUT,B-3877-OUT;n:type:ShaderForge.SFN_Max,id:4934,x:31743,y:32519,varname:node_4934,prsc:2|A-3115-OUT,B-3008-OUT;n:type:ShaderForge.SFN_Multiply,id:7642,x:32291,y:33314,cmnt:控制天光强度,varname:node_7642,prsc:2|A-961-OUT,B-6154-OUT;n:type:ShaderForge.SFN_Slider,id:6154,x:32106,y:33501,ptovrint:False,ptlb:EnvColPower,ptin:_EnvColPower,varname:node_6154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:9206,x:32459,y:33218,cmnt:环境颜色结果,varname:node_9206,prsc:2|A-1685-RGB,B-7642-OUT;proporder:1685-3292-7000-2560-2189-1969-6154;pass:END;sub:END;*/

Shader "ZD/L07/OldSchoolP" {
    Properties {
        _BaseColor ("BaseColor", Color) = (0.5754717,0.3982264,0.3982264,1)
        _SpecularPower ("SpecularPower", Range(0, 30)) = 30
        _EnvUpCol ("EnvUpCol", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.5,0.5,0.5,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.5,0.5,0.5,1)
        _AOMap ("AOMap", 2D) = "white" {}
        _EnvColPower ("EnvColPower", Range(0, 1)) = 0
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _AOMap; uniform float4 _AOMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvColPower)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
////// Emissive:
                float4 _BaseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseColor );
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float node_1227 = i.normalDir.g;
                float node_5209 = 0.0;
                float node_1153 = max(node_1227,node_5209); // 上环境遮罩
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_7967 = max(node_5209,(node_1227*(-1.0))); // 下环境遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float _EnvColPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvColPower );
                float4 _AOMap_var = tex2D(_AOMap,TRANSFORM_TEX(i.uv0, _AOMap)); // 环境遮挡
                float3 emissive = ((attenuation*((_BaseColor_var.rgb*max(dot(i.normalDir,lightDirection),0.0))+pow(max(0.0,dot(i.normalDir,halfDirection)),_SpecularPower_var)))+((_BaseColor_var.rgb*(((node_1153*_EnvUpCol_var.rgb)+(((1.0-node_1153)-node_7967)*_EnvSideCol_var.rgb)+(node_7967*_EnvDownCol_var.rgb))*_EnvColPower_var))*_AOMap_var.rgb));
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _AOMap; uniform float4 _AOMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvColPower)
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
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
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
