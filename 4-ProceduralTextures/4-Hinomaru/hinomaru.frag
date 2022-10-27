#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

bool is_inside() {

    float xdif = vtexCoord.x - 0.5;
    float ydif = vtexCoord.y - 0.5;
    return sqrt(xdif*xdif + ydif*ydif) < 0.2;
}

void main()
{
    if (is_inside()) fragColor = vec4(1, 0, 0, 0);
    else fragColor = vec4(1);
}
