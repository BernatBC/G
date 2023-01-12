#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colormap;

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
    vec2 vtex2 = vtexCoord*2;

    fragColor = texture(colormap, vtex2);
    vec3 hsvOriginal = rgb2hsv(fragColor.xyz);

    //Baix esquerra
    if (vtexCoord.x < 0.5 && vtexCoord.y < 0.5) {
        vec3 hsv1 = vec3(hsvOriginal.x + 0.2, 2*hsvOriginal.y, hsvOriginal.z);
        fragColor = vec4(hsv2rgb(hsv1), 1);
    }
    //Baix dreta
    if (vtexCoord.x > 0.5 && vtexCoord.y < 0.5){
        vec3 hsv1 = vec3(hsvOriginal.x + 0.6, 2*hsvOriginal.y, hsvOriginal.z);
        fragColor = vec4(hsv2rgb(hsv1), 1);
    }
    //dalt esquerra
    if (vtexCoord.x < 0.5 && vtexCoord.y > 0.5) {
        vec3 hsv1 = vec3(hsvOriginal.x + 0.4, 2*hsvOriginal.y, hsvOriginal.z);
        fragColor = vec4(hsv2rgb(hsv1), 1);
    }
    //dalt dreta
    if (vtexCoord.x > 0.5 && vtexCoord.y > 0.5) {
        vec3 hsv1 = vec3(hsvOriginal.x + 0.8, 2*hsvOriginal.y, hsvOriginal.z);
        fragColor = vec4(hsv2rgb(hsv1), 1);
    }
}
