Shader "ZD/L21/GridFade"
{
    Properties {
        [Header(Texture)][Space(10)]
            _MainTex    ("RGB:基础颜色 A:环境遮罩", 2D)     = "white"{}
            _NormalTex  ("RGB:法线贴图", 2D)               = "bump"{}
            _SpecTex    ("RGB:高光颜色 A:高光次幂", 2D)     = "gray"{}
            _CubeMap    ("RGB:环境贴图", cube)             = "_Skybox"{}
            _EmitTex    ("RGB:自发光贴图", 2D)             = "gray"{}
        [Header(Diffuse)][Space(10)]
            _MainCol        ("基础颜色", Color)            = (0.5, 0.5, 0.5, 1.0)
            _EnvDiffuseInt  ("环境反射强度", Range(0,1))    = 0.5
            _EnvUpCol       ("环境天顶颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
            _EnvSideCol     ("环境水平颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
            _EnvDownCol     ("环境水平颜色", Color)         = (0.5, 0.5, 0.5, 1.0)
        [Header(Specular)][Space(10)]
            _SpecPow        ("高光次幂", Range(1,90))          = 1
            _EnvSpecInt     ("环境镜面反射强度",  Range(0,5))   = 3
            _FresnelPow     ("菲涅尔次幂", Range(1,10))        = 5
            _CubemapMip     ("环境球Mip", Range(1,7))         = 1
        [Header(Emission)][Space(10)]
            _EmitInt        ("自发光强度", Range(0,10))        = 1
        [Header(Effect)][Space(10)]
            _EffMap01       ("特效纹理", 2D)        = "gray"{}
            _EffMap02       ("特效纹理", 2D)        = "gray"{}
    [HDR]   _EffCol         ("光效颜色", color)     = (0.0,0.0,0.0,0.0)
            _EffParams      ("x: 波密度 y: 波速度 z: 混乱度 w: 消散速度", vector) = (0.03,3.0,0.2,2.5)
    }
    //材质面板参数
    SubShader {
        Tags {
            "RenderType" = "Transparent"
            "Queue" = "Transparent"
        }
        LOD 100
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend one OneMinusSrcAlpha
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
            //Effect
            uniform sampler2D _EffMap01;
            uniform sampler2D _EffMap02;
            uniform float3 _EffCol;
            uniform float4 _EffParams;
            
            struct VertexInput {
                float4 vertex  : POSITION;
                float2 uv0     : TEXCOORD0;
                float2 uv1     : TEXCOORD1;
                float4 normal  : NORMAL;
                float4 tangent : TANGENT;
                float4 color   : COLOR;         //顶点色信息
            };
            
            struct VertexOutput {
                float4 pos     : SV_POSITION;   //屏幕顶点位置
                float2 uv0     : TEXCOORD0;     //uv0
                float2 uv1     : TEXCOORD1;     //uv1
                float4 posWS   : TEXCOORD2;     //世界顶点位置信息
                float3 tDirWS  : TEXCOORD3;     //切线方向
                float3 bDirWS  : TEXCOORD4;     //副切线方向
                float3 nDirWS  : TEXCOORD5;     //法线方向
                float4 effectMask : TEXCOORD6;
                LIGHTING_COORDS(7,8)            //投影需求
            };
            
            //函数
            float4 Animation(float noise, float mask, float3 normal, inout float3 vertex)
            {
                //生成锯齿波
                float baseMask = abs(frac(vertex.y * _EffParams.x - _Time.x * _EffParams.y) - 0.5)*2;
                baseMask = min(1.0, baseMask * 2.0);
                
                //使用noise偏移锯齿波
                baseMask += (noise - 0.5) * _EffParams.z;
                
                //smoothstep出各等级mask
                float4 effectMask = float4(0.0, 0.0, 0.0, 0.0);
                effectMask.x = smoothstep(0.0, 0.9, baseMask);
                effectMask.y = smoothstep(0.2, 0.7, baseMask);
                effectMask.z = smoothstep(0.4, 0.5, baseMask);
                
                //将顶点色遮罩存入effectMask.w
                effectMask.w = mask;

                //顶点动画 * mask的作用就是平方一下，让抖动效果更明显
                vertex.xz += normal.xz * (1.0 - effectMask.y) * effectMask.w * mask;
                return effectMask;
            }
            
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                //采样3D噪声图
                float noise = tex2Dlod(_EffMap02, float4(v.uv1, 0.0, 0.0)).r;
                //应用函数
                o.effectMask = Animation(noise, v.color.r, v.normal.xyz, v.vertex.xyz);
                
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.uv1 = v.uv1;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            
            float4 frag(VertexOutput i) : COLOR {
            //----------------光照模型----------------//
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
                float3 emission = var_EmitTex * _EmitInt;
                

            //----------------特效部分----------------//
                //采样噪声图01
                float3 var_EffMap01 = tex2D(_EffMap01, i.uv1).xyz;
                float meshMask = var_EffMap01.x;        // 格子线mask
                float faceRandomMask = var_EffMap01.y;  // 随机灰度mask
                float faceSlopeMask = var_EffMap01.z;   // 梯度mask

                //获取effectmask
                float smallMask = i.effectMask.x;
                float midMask = i.effectMask.y;
                float bigMask = i.effectMask.z;
                float baseMask = i.effectMask.w;        //将底座排除在外

                //计算透明度通道
                float midOpacity = saturate(floor(min(faceRandomMask, 0.999999) + midMask));
                float bigOpacity = saturate(floor(min(faceRandomMask, 0.999999) + bigMask));
                float opacity = lerp(1.0, min(midOpacity, bigOpacity), baseMask);

                //叠加自发光
                float meshEmitInt = (bigMask - smallMask) * meshMask;
                meshEmitInt = meshEmitInt * meshEmitInt;
                emission += _EffCol * meshEmitInt * baseMask;
                
            //----------------最终混合----------------//
                float3 finalRGB = envLighting + emission + dirLighting;
                
                //返回值
                return float4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
