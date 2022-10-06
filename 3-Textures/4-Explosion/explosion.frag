#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;
uniform float time;

void main()
{
    vec2 v2 = vtexCoord;
    v2.x /= 8;
    v2.y /= 6;
    v2.y += float(5)/6;
    vec2 v3 = v2;

    v2.x = v3.x + float(int(mod(30*time, 48))%8)/8;
    v2.y = v3.y - float(int(mod(30*time, 48))/8)/6;
    fragColor = texture(explosion, v2);
    fragColor *= fragColor[3];
}
