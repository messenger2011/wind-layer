precision highp float;

uniform sampler2D u_screen;
uniform float u_opacity;
uniform float u_fade;

varying vec2 vUv;

void main() {
    vec4 color = texture2D(u_screen, vUv);
    // floor() is intentional: ensures trail pixels die at the 1/255 quantization
    // boundary instead of persisting forever (round() would keep them immortal).
    gl_FragColor = vec4(floor(255.0 * color * u_opacity * u_fade) / 255.0);
}
