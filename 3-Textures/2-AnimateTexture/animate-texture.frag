#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float speed = 0.1;
uniform float time;

uniform sampler2D image;

void main()
{
    fragColor = frontColor * texture(image, vec2(vtexCoord.x + time*speed, vtexCoord.y + time*speed));
}
