#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

bool circle(float posx, float posy) {
    float xdif = vtexCoord.x - posx;
    float ydif = vtexCoord.y - posy;
    if (xdif < 0) xdif *= -1;
    if (ydif < 0) ydif *= -1;
    return sqrt(xdif*xdif + ydif*ydif) < 0.04;
}

vec4 color() {
    vec4 c;
    c.x = 0.9;
    c.y = 0.9;
    c.z = 0.9;
    c.w = 0;
    return c;
}

vec4 color2() {
    vec4 c;
    c.x = 1- vtexCoord.y;
    c.y = 1 - 2*vtexCoord.x;
    c.z = 1 - vtexCoord.x;
    c.w = 0;
    return c;
}

void main()
{
    fragColor = color();
    if (circle(0.3, 0.6)) fragColor = color2();
    if (circle(0.3, 0.5)) fragColor = color2();
    if (circle(0.3, 0.7)) fragColor = color2();
    if (circle(0.3, 0.4)) fragColor = color2();
    if (circle(0.3, 0.3)) fragColor = color2();
    if (circle(0.3, 0.8)) fragColor = color2();
    if (circle(0.3, 0.2)) fragColor = color2();
    if (circle(0.4, 0.8)) fragColor = color2();
    if (circle(0.5, 0.8)) fragColor = color2();
    if (circle(0.6, 0.8)) fragColor = color2();
    if (circle(0.7, 0.6)) fragColor = color2();
    if (circle(0.7, 0.7)) fragColor = color2();
    if (circle(0.7, 0.4)) fragColor = color2();
    if (circle(0.7, 0.3)) fragColor = color2();
    if (circle(0.4, 0.5)) fragColor = color2();
    if (circle(0.5, 0.5)) fragColor = color2();
    if (circle(0.6, 0.5)) fragColor = color2();
    if (circle(0.4, 0.2)) fragColor = color2();
    if (circle(0.5, 0.2)) fragColor = color2();
    if (circle(0.6, 0.2)) fragColor = color2();
}
