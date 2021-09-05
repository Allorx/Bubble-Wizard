varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;
uniform mediump vec4 camera_position;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;

void main()
{
    vec4 color = texture2D(tex0, var_texcoord0.xy);

    vec3 viewDirectionW = normalize(camera_position.xyz - var_position.xyz);
    // Fresnel
    float fresnelTerm = dot(viewDirectionW, var_normal);
    fresnelTerm = clamp(1.0 - fresnelTerm, 0., 1.);

    gl_FragColor = vec4(color.rgb*tint.xyz, fresnelTerm*tint.w);
}

// add refraction?