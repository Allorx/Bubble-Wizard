varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;

void main()
{
    vec4 color = texture2D(tex0, var_texcoord0.xy);

    // Diffuse light calculations
    vec3 ambient_light = vec3(0.5);
    vec3 diff_light = vec3(normalize(var_light.xyz - var_position.xyz));
    diff_light = max(dot(var_normal,diff_light), 0.0) + ambient_light;
    diff_light = clamp(diff_light, 0.0, 1.0);

    /*
    //blur
    vec4 blur_tex;
    //box blur
    for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {
            blur_tex += texture2D(tex0, var_texcoord0.xy + (vec2(i, j)))*0.15;
        }
    }
    */

    //fog
    //vec3 fog = mix(color.rgb, blur_tex.rgb, -var_position.z*0.035);

    gl_FragColor = vec4(color.rgb*tint.xyz*diff_light, tint.w);
}

