varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;
uniform mediump vec4 camera_position;

uniform lowp sampler2D depth_tex;
uniform lowp vec4 tint;

float near = 0.1; 
float far  = 20.0; 
float scale = 8.0;

float linearize_depth(float depth) 
{
    float z = depth * 2.0 - 1.0;
    return (2.0 * near * far) / (far + near - z * (far - near));
}

void main()
{   
    float depth = linearize_depth(gl_FragCoord.z) / far;
    //increase contrast
    float depth_scaled = (depth - 0.5) * scale + 0.5;

    gl_FragColor = vec4(vec3(depth_scaled), 1.0f);
}

// add refraction?