#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform bool classic = true;

bool is_inside() {

    float xdif = vtexCoord.x - 0.5;
    float ydif = vtexCoord.y - 0.5;
    if (xdif < 0) xdif *= -1;
    if (ydif < 0) ydif *= -1;
    return sqrt(xdif*xdif + ydif*ydif) < 0.2;
}

bool is_ray() {
    vec2 u = vec2(vtexCoord.x - 0.5, vtexCoord.y - 0.5);
    float angle = atan(u.t, u.s);
    return mod(16*angle/3.1415926 + 0.5, 2) < 1;
}

void main()
{
    if (is_inside()) fragColor = vec4(1, 0, 0, 0);
    else if (!classic && is_ray()) fragColor = vec4(1, 0, 0, 0);
    else fragColor = vec4(1);
}
