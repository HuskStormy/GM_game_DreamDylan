varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform bool _shadow;
uniform bool _Limt;
uniform float _dist;

float easeOutCubic(float t) {
    float f = t - 1.0;
    return (f * f * f + 1.0);
}

void main()
{
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 color_final;

    if (_shadow == true || _Limt==true) {
		color_final = vec4(0.0, 0.0, 0.1, color.a);
    } else {
        
		color_final = vec4(
            color.r - ((color.r - 0.00) * _dist),
            color.g - ((color.g - 0.00) * _dist),
            color.b - ((color.b - 0.10) * _dist),
            color.a
        );
    }

    gl_FragColor = color_final;
}

