#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D image;
uniform int tiles = 2;

void main()
{
    fragColor = texture(image, vtexCoord*tiles);
}
