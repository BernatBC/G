#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n;

void main()
{
    if (int(fract(vtexCoord.x)*n)%2 == 0 && int(fract(vtexCoord.y)*n)%2 == 0 || int(fract(vtexCoord.x)*n)%2 != 0 && int(fract(vtexCoord.y)*n)%2 != 0) fragColor = vec4(0.8);
    else fragColor = vec4(0);
}
