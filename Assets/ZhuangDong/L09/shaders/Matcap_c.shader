Shader "ZD/L09/Matcap_c" {
//shader路径名
    Properties {
        _NormalMap ("法线贴图", 2D) = "bump" {}
        _Matcap ("Matcap", 2D) = "bump" {}
        _FresnelPow ("菲涅尔强度", Range(0, 2)) = 0
        _EnvSpecInt ("环境镜面反射强度", Range(0, 1)) = 1
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            
            //输入参数
            uniform sampler2D _NormalMap;
            uniform sampler2D _Matcap;
            uniform float _FresnelPow;
            uniform float _EnvSpecInt;
            
            //输入结构：输入到顶点着色器中的结构
            struct VertexInput {
                float4 vertex : POSITION;     // 输入模型顶点信息
                float3 normal : NORMAL;       // 输入模型法线信息
                float4 tangent : TANGENT;
                float2 uv0 : TEXCOORD0;
            };
            
            //输出结构：从顶点着色器中输出的结构
            struct VertexOutput {
                float4 pos    : SV_POSITION;  // 由模型顶点信息换算屏幕空间位置
                float2 uv0    : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;    // 由模型法线信息换算世界空间法线信息
                float3 tDirWS : TEXCOORD2;  
                float3 bDirWS : TEXCOORD3;
                float3 posWS  : TEXCOORD4;
            };
            
            //输入结构 > 顶点着色器 > 输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;              // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );      // 变换顶点信息 赋值给输出结构
                o.uv0 = v.uv0;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);  // 顶点位置信息 OS>WS
                //构建ntb矩阵
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                return o;
            }
            
            //输出结构 > 片元着色器/像素着色器
            float4 frag(VertexOutput i) : COLOR {
                //贴图采样
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv0)).rgb;//实际上就是 nDirTS
                
                //准备向量
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 nDirVS = mul(UNITY_MATRIX_V, nDirWS);
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);

                //准备中间变量
                float vdotn = dot(vDirWS, nDirVS);
                float2 matcapUV = nDirVS.rg * 0.5 + 0.5;        //s

                //光照模型
                float3 matcap = tex2D(_Matcap, matcapUV);
                float3 fresnel = pow(max(0.0, 1-vdotn), _FresnelPow);
                float3 envSpecLighting = matcap * fresnel * _EnvSpecInt;
                
                //返回值
                return float4(envSpecLighting, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
