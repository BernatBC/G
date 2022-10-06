#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n = 8;

void main()
{
    float x = fract(vtexCoord.x)*n;
    float y = fract(vtexCoord.y)*n;
    if (fract(x) < 0.1 || fract(y) < 0.1) fragColor = vec4(0);
    else fragColor = vec4(0.8);
}
