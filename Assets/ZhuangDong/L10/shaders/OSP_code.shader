Shader "ZD/L10/OSP_code"
{
    Properties {
        [Header(Texture)]
            _MainTex    ("RGB:基础颜色 A:环境遮罩", 2D)     = "white"{}
            _NormalTex  ("RGB:法线贴图", 2D)               = "bump"{}
            _SpecTex    ("RGB:高光颜色 A:高光次幂", 2D)     = "gray"{}
            _CubeMap    ("RGB:环境贴图", cube)             = "_Skybox"{}
            _EmitTex    ("RGB:自发光贴图", 2D)             = "gray"{}
        [Header(Diffuse)]
            _MainCol        ("基础颜色", Color)            = (0.5, 0.5, 0.5, 1.0)
            _EnvDiffuseInt  ("环境反射强度", Range(0,1))    = 0.5
            _EnvUpCol       ("环境天顶颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
            _EnvSideCol     ("环境水平颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
            _EnvDownCol     ("环境水平颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
        [Header(Specular)]
            _SpecPow        ("高光次幂", Range(1,90))          = 1
            _EnvSpecInt     ("环境镜面反射强度",  Range(0,5))   = 3
            _FresnelPow     ("菲涅尔次幂", Range(1,10))        = 5
            _CubemapMip     ("环境球Mip", Range(1,7))         = 1
        [Header(Emission)]
            _EmitInt        ("自发光强度", Range(0,10))        = 1
    }
    //材质面板参数
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
            
            //追加包含文件
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0

            //输入参数
            //Texture
            uniform sampler2D _MainTex;
            uniform sampler2D _NormalTex;
            uniform sampler2D _SpecTex;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _EmitTex;
            //Diffuse
            uniform float3 _MainCol;
            uniform float _EnvDiffuseInt;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            //Specular
            uniform float _SpecPow;
            uniform float _EnvSpecInt;
            uniform float _FresnelPow;
            uniform float _CubemapMip;
            //Emission
            uniform float _EmitInt;
            
            struct VertexInput {
                float4 vertex  : POSITION;
                float2 uv0     : TEXCOORD0;
                float4 normal  : NORMAL;
                float4 tangent : TANGENT;
            };
            //输入结构：输入到顶点着色器中的结构
            
            struct VertexOutput {
                float4 pos     : SV_POSITION;   //屏幕顶点位置
                float2 uv0     : TEXCOORD0;     //uv
                float4 posWS   : TEXCOORD1;     //世界顶点位置信息
                float3 tDirWS  : TEXCOORD2;     //切线方向
                float3 bDirWS  : TEXCOORD3;     //副切线方向
                float3 nDirWS  : TEXCOORD4;     //法线方向
                LIGHTING_COORDS(5,6)            //投影需求
            };
            //输出结构：从顶点着色器中输出的结构
            
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv0 = v.uv0;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                /*o.tDirWS = normalize(mul(unity_ObjectToWorld, v.tangent).xyz);  //试试看
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS));*/
                o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            //顶点着色器
            
            float4 frag(VertexOutput i) : COLOR {
                //向量准备
                float3 nDirTS = UnpackNormal(tex2D(_NormalTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS,i.bDirWS,i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 lDirWS = normalize(_WorldSpaceLightPos0.xyz);
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 vrDirWS = reflect(-vDirWS, nDirWS); //取反的原因
                float3 lrDirWS = reflect(-lDirWS, nDirWS);

                //纹理采样
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float3 var_EmitTex = tex2D(_EmitTex, i.uv0);
                
                //中间量准备
                float ndotl = dot(nDirWS, lDirWS);
                float vdotr = dot(vDirWS, lrDirWS);
                float vdotn = dot(vDirWS, vrDirWS);

                //光照模型
                //光源漫反射
                float3 baseCol = var_MainTex.rgb * _MainCol;
                float lambert = max(0.0, ndotl);
                //光源镜面反射
                float specCol = var_SpecTex.rgb;
                float specPow = lerp(1,_SpecPow,var_SpecTex.a);
                float phong = pow(max(vdotr,0.0) ,specPow);
                //光源反射混合
                float shadow = LIGHT_ATTENUATION(i);
                float3 dirLighting = (baseCol*lambert + specCol*phong) * _LightColor0 * shadow;
                //环境漫反射
                float UpMask = max(0.0, nDirWS.g);
                float DownMask = max(0.0, -nDirWS.g);
                float SideMask = 1-UpMask-DownMask;
                float3 envCol = _EnvUpCol * UpMask + SideMask * _EnvSideCol + DownMask * _EnvDownCol;
                float fresnel = pow(max(0.0, 1.0 - vdotn), _FresnelPow);
                //环境镜面反射
                float CubemapMip = lerp(_CubemapMip, 1.0, var_SpecTex.a);
                float3 var_Cubemap = texCUBElod(_CubeMap, float4(vrDirWS, CubemapMip)).rgb;
                //环境反射混合
                float occlussion = var_MainTex.a;
                float3 envLighting = occlussion * (baseCol * envCol * _EnvDiffuseInt + var_Cubemap * fresnel * _EnvSpecInt * var_SpecTex.a);
                //光照混合
                float3 emision = var_EmitTex * _EmitInt;
                //最终混合
                float3 finalRGB = envLighting + emision + dirLighting;
                //返回值
                return float4(finalRGB,1.0);
                //float4(lambert,lambert,lambert,1.0);
            }
            //片元着色器/像素着色器
            ENDCG
        }
    }
    FallBack "Diffuse"
}
