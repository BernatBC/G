#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

bool circle1() {
    float xdif = vtexCoord.x - 0.4;
    float ydif = vtexCoord.y - 0.5;
    if (xdif < 0) xdif *= -1;
    if (ydif < 0) ydif *= -1;
    return sqrt(xdif*xdif + ydif*ydif/1.33) < 0.35;
}

bool circle2() {
    float xdif = vtexCoord.x - 0.55;
    float ydif = vtexCoord.y - 0.5;
    if (xdif < 0) xdif *= -1;
    if (ydif < 0) ydif *= -1;
    return sqrt(xdif*xdif + ydif*ydif/1.33) < 0.35;
}

bool square() {
    return vtexCoord.x > 0.5 && vtexCoord.x < 0.8 && vtexCoord.y > 0.3 && vtexCoord.y < 0.7;
}

void main()
{
    vec4 color = vec4(float(130)/255, float(172)/255, float(102)/255, 1);
    if (square() || circle1() && !circle2()) color = vec4(1, 1, 1, 1);
    fragColor = color;
}
