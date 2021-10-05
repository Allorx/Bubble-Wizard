varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;

// distance fog
varying mediump float var_dist;

void main()
{
    vec4 color = texture2D(tex0, var_texcoord0.xy);
    
    // Fog
    float fog_start = 15;
    float fog_end = 40;
    float fog_factor = (var_dist-fog_start)/(fog_end-fog_start);
    float fog = clamp(fog_factor, 0., 1.);

    gl_FragColor = vec4(color.rgb*tint.xyz+fog, tint.w);
    // alt: gl_FragColor = vec4(color.rgb*tint.xyz, tint.w-fog);
}

