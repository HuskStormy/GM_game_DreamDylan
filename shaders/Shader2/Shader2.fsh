varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Uniforms
uniform sampler2D surfaceTexture; // La textura con las formas negras
uniform vec2 textureSize; // Tamaño de la textura


void main() {
    // Coordenadas UV normalizadas
    vec2 uv = gl_FragCoord.xy / textureSize;
    
    // Muestreamos la textura de la superficie
    vec4 surfaceColor = texture2D(surfaceTexture, v_vTexcoord);
    
    // Usamos el color de la textura como queramos
    gl_FragColor = surfaceColor;
}