#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float slice=0.1;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;
uniform float time;

void main()
{
    if (mod(time, 4*slice) >= 3*slice) fragColor = texture(sampler3, vtexCoord);
    else if (mod(time, 4*slice) >= 2*slice) fragColor = texture(sampler2, vtexCoord);
    else if (mod(time, 4*slice) >= slice) fragColor = texture(sampler1, vtexCoord);
    else fragColor = texture(sampler0, vtexCoord);
}
