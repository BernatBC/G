#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D t;

void main()
{
    vec2 v = vec2(vtexCoord.x*0.6, vtexCoord.y);
    if (vtexCoord.x < float(1)/6) v.x += 0.4;
    else if (vtexCoord.x < float(2)/6) v.x += 0.6;
    else if (vtexCoord.x < float(3)/6) v.x += 0.2;
    else if (vtexCoord.x < float(4)/6) v.x -= 0.2;
    else if (vtexCoord.x < float(5)/6) v.x += 0.2;
    else v.x += 0.1;
    fragColor = texture(t, v);
}
