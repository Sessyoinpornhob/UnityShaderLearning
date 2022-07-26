Shader "ZD/L12/Dota2" {
//shader路径名
    Properties {
        [Header(Texture)]
        _MainTex        ("RGB:颜色 A:透明贴图", 2d) = "white"{}
        _MaskTex        ("R:高光强度 G:边缘光强度 B:高光染色 A:高光次幂", 2d) = "white"{}
        _NormTex        ("RGB:法线贴图", 2d) = "bump"{}
        _MatelnessMask  ("金属度遮罩", 2d) = "black"{}
        _EmissionMask    ("自发光遮罩", 2d) = "black"{}
        _DiffWarpTex    ("颜色Warp图", 2d) = "gray"{}
        _FresWarpTex    ("菲涅尔Warp图", 2d) = "gray"{}
        _Cubemap        ("环境球", cube) = "_Skybox"{}
        //表面反射
        [Header(Diffuse)][Space(10)]
        _MainCol    ("基础颜色", color) = (0.9, 0.9, 0.9, 1.0)
        _LightCol   ("光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        [Header(Specular)][Space(10)]
        _SpwcPow    ("高光次幂", range(0.0, 30.0)) = 5
        _SpecInt    ("高光强度", range(0.0, 3.0)) = 1
        [Header(EnvDiffuse)][Space(10)]
        _EnvCol     ("环境光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        _EnvDiffInt ("环境漫反射强度", range(0.0, 5.0)) = 0.5
        [Header(EnvSpecular)][Space(10)]
        _EnvSpecInt ("环境镜面反射强度", range(0.0,10.0)) = 1
        [Header(RimLight)][Space(10)]
        [HDR]_RimCol     ("轮廓光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        [Header(Emit)][Space(10)]
        _EmitInt         ("自发光强度",range(0.0, 10.0)) = 5
        [HideInInspector]
        _Cutoff     ("Alpha cutoff", range(0,1)) = 0.5
        [HideInInspector]
        _Color ("Main Color", Color) = (1.0, 1.0, 1.0, 1.0)
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
            cull off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            //以上暂时不管

            //输入变量
            //纹理采样
            uniform sampler2D _MainTex;
            uniform sampler2D _NormTex;
            uniform sampler2D _MaskTex;
            uniform sampler2D _MatelnessMask;
            uniform sampler2D _EmissionMask;
            uniform sampler2D _DiffWarpTex;
            uniform sampler2D _FresWarpTex;
            uniform samplerCUBE _Cubemap;
            //表面漫反射 镜面反射
            uniform half3 _MainCol;
            uniform half3 _LightCol;
            uniform half _SpwcPow;
            uniform half _SpecInt;
            //环境漫反射 环境镜面反射
            uniform half3 _EnvCol;
            uniform half _EnvDiffInt;
            uniform half _EnvSpecInt;
            //轮廓光
            uniform half3 _RimCol;
            //自发光
            uniform half _EmitInt;
            //裁切
            uniform half _Cutoff;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float2 uv0 : TEXCOORD0;
                float4 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            //输入结构：输入到顶点着色器中的结构
            
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 tDirWS : TEXCOORD2;
                float3 bDirWS : TEXCOORD3;
                float3 nDirWS : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            //输出结构：从顶点着色器中输出的结构
            
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv0 = v.uv0;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal( v.normal );
                o.tDirWS = normalize(mul(unity_ObjectToWorld, v.tangent).xyz);
                o.bDirWS = normalize(cross(o.tDirWS, o.nDirWS));
                TRANSFER_VERTEX_TO_FRAGMENT(o);
                return o;
            }
            //顶点着色器
            
            float4 frag(VertexOutput i) : COLOR {
                //向量准备
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(TBN, nDirTS));
                float3 lDirWS = normalize(_WorldSpaceLightPos0.xyz);
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 vrDirWS = reflect(-vDirWS, nDirWS);
                float3 lrDirWS = reflect(-lDirWS, nDirWS);
                
                //中间量准备
                float ndotl = dot(nDirWS, lDirWS);
                float vdotr = dot(vDirWS, lrDirWS);
                float vdotn = dot(vDirWS, vrDirWS);
                
                //纹理采样
                half4 var_MainTex = tex2D(_MainTex, i.uv0);
                half4 var_MaskTex = tex2D(_MaskTex, i.uv0);
                half var_MatelnessMask = tex2D(_MatelnessMask, i.uv0).r;
                half var_EmissionMask = tex2D(_EmissionMask, i.uv0).r;
                half3 var_FresWarpTex = tex2D(_FresWarpTex, vdotn).rgb;
                half3 var_Cubemap = texCUBElod(_Cubemap, float4(vrDirWS, lerp(8.0, 0.0, var_MaskTex.a))).rgb;
                
                //提取信息
                half3 baseCol = var_MainTex.rgb;
                half opacity = var_MainTex.a;
                half specInt = var_MaskTex.r;
                half rimInt = var_MaskTex.g;
                half specTint = var_MaskTex.b;
                half specPow = var_MaskTex.a;
                half matellic = var_MatelnessMask;
                half emitInt = var_EmissionMask;
                half3 envCube = var_Cubemap;
                half shadow = LIGHT_ATTENUATION(i);
                
                //光照模型
                    //漫反射颜色 镜面反射颜色
                    half3 diffCol = lerp(baseCol, half3(-0.1, -0.1, -0.1), matellic);
                    //认为金属没有漫反射颜色，因此非金属漫反射为baseCol，金属部分漫反射靠近黑色.
                    //上面的half3甚至可以暴露出去，作为一个调节项.
                    //lerp——>左0右1；
                    half3 specCol = lerp(baseCol, half3(0.3, 0.3, 0.3), specTint) * specInt;
                    //镜面反射部分，lerp的调节值为specTint，这个数值金属的部分为0，非金属的部分为1，
                    //其含义为，金属部分的高光（镜面反射结果）颜色为baseCol，而非金属部分的高光颜色为深灰色。

                    //菲涅尔
                    half3 fresnel = lerp(var_FresWarpTex, 0.0, matellic);
                    half fresnelCol = fresnel.r; // 无实际用途
                    half fresnelRim = fresnel.g;
                    half fresnelSpec = fresnel.b;
                
                    //漫反射模型
                    half halfLambert = ndotl * 0.5 + 0.5;
                    half var_DiffWarpTex = tex2D(_DiffWarpTex, float2(halfLambert, 0.2));
                    half3 dirDiff = halfLambert * var_DiffWarpTex * diffCol;

                    //镜面反射模型
                    half phong = pow(max(vdotr,0.0), _SpwcPow * specPow);
                    half spec = phong * max(ndotl, 0.0);
                    spec = max(spec, fresnelSpec);
                    spec = spec * _SpecInt;
                    //spec的高光强度很高，因此高光的范围较大，且金属和非金属的高光程度难以分辨。
                    half3 dirSpec = specCol * spec * _LightCol;
                    //spec*specCol 由于specCol区分出了金属和非金属的高光范围和颜色，因此，相乘后能够区分出二者

                    //环境漫反射
                    half3 envDiff = diffCol * _EnvCol * _EnvDiffInt;

                    //环境镜面反射
                    half reflectInt = max(fresnelSpec, matellic) * specInt;
                    //计算反射率 金属会镜面反射；而非金属的菲涅尔部分存在镜面反射；这是一个讨巧的取最大的方法
                    half3 envSpec = reflectInt * specCol * envCube * _EnvSpecInt;
                    //混合 反射率 反射环境球 反射颜色（来自镜面反射的参数，也可以当环境反射用？） 反射强度

                    //轮廓光
                    half3 rimLight = _RimCol * max(0.0, nDirWS.g) * rimInt;
                    //菲涅尔贴图边缘光有大问题，暂时感觉是用不了（指rempTex的方法不行）
                    //可以自己写一个菲涅尔试试看，原理相差不大

                    //自发光
                    half3 emission = diffCol * emitInt * _EmitInt;
                
                //合并光照模型
                half3 finalRGB = ( dirDiff + dirSpec ) * shadow + envDiff + envSpec + rimLight + emission;
                
                //裁切
                clip(opacity - _Cutoff);
                
                //返回值
                return float4(finalRGB, 1.0);
            }
            //片元着色器/像素着色器
            ENDCG
        }
    }
    FallBack "Legacy Shaders/Transparent/Cutout/VertexLit"
}
