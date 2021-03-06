uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uMixColor;

uniform vec3 uCameraPosition;

varying vec3 vPosition;
varying float vDepth;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = vTexCoord;
	if (uTexScale.x < 1.0 || uTexScale.y < 1.0)
		tex = mod(tex * uTexScale, uTexScale); // GM sprite bug workaround
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	baseColor.rgb = mix(baseColor.rgb, uMixColor.rgb, uMixColor.a); // Mix
	
	gl_FragColor = baseColor;
	
	if (gl_FragColor.a == 0.0)
		discard;
}
