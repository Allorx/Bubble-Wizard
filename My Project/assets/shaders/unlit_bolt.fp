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

    // increase alpha above certain float "height"
    float visibility = mix(0.0, color.a, var_position.y + 2.0);

    gl_FragColor = vec4(color.rgb*tint.xyz, tint.w*visibility);
}

// add refraction?