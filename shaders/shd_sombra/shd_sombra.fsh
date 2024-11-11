varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float _dir_x;
uniform float _dir_y;



float easeIn(float t) {
    return max(min(1.0 - (1.0 - t) * (1.0 - t) ,1.) ,0.);
}
// Función para calcular la distancia entre dos puntos
float distanceBetweenPoints(vec2 p1, vec2 p2) {
    vec2 diff = p2 - p1;
    return sqrt(diff.x * diff.x + diff.y * diff.y);
}

// Ease-out cuártico (aún más pronunciado)
float easeOutQuart(float t) {
    float f = t - 1.0;
    return 1.0 - (f * f * f * f);
}
float easeOutCubic(float t) {
    float f = t - 1.0;
    return (f * f * f + 1.0);
}
void main()
{
	
	float Alpha = 0.95;
	float dist = distanceBetweenPoints(vec2(_dir_x,_dir_y), v_vTexcoord);
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	color.rgba = vec4(0.,0.,0.05, color.a*0.6);
	
	vec4 color_x = vec4(.0,.0,.05,easeOutCubic(dist));
	//float _y = abs(v_vTexcoord.y - _dir_y)/_dir_y;
	//vec4 color_y = vec4(.0,.0,.05,easeOutCubic(dist));
	
	vec4 color_final = (color + color_x);
	color_final.a = color_final.a * Alpha;
	
    gl_FragColor = color_final * v_vColour;
}
