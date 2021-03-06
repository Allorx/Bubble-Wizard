varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D original;
uniform lowp sampler2D original_depth;
uniform lowp vec4 tint;
uniform lowp vec4 chromatic;

void main()
{
	//vec4 color = texture2D(original, var_texcoord0.xy);

	//chromatic abberation
	vec4 rValue = texture2D(original, var_texcoord0.xy - chromatic.x);  
	vec4 gValue = texture2D(original, var_texcoord0.xy);
	vec4 bValue = texture2D(original, var_texcoord0.xy + chromatic.x);  

	// Combine the offset colors.
	vec4 color = vec4(rValue.r, gValue.g, bValue.b, 1.0);
	
	vec4 color_blur = vec4(0., 0., 0., 1.);
	vec4 amount = texture2D(original_depth, var_texcoord0.xy);
	
	//blur
	vec2 texSize  = vec2(float(textureSize(original, 0).x), float(textureSize(original, 0).y));

	//amount to spread blur without sampling more fragments
	float separation = 3.0;

	float count = 0.0;
	//blur kernel size - increases blur
	for (int i = -3; i <= 3; ++i) {
		for (int j = -3; j <= 3; ++j) {
			color_blur.rgb += texture2D(original, (gl_FragCoord.xy + vec2(i, j)*separation)/texSize).rgb;
			count += 1.0;
		}
	}
	color_blur.rgb /= count;

	//mix original with blurred based on depth
	
	vec4 out_color = mix(color, color_blur + tint, amount.r);
	
	gl_FragColor = out_color;
}
