#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform sampler2D colormap;

vec2 drawBar(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) v2.x = 2*vtexCoord.x + float(image-x)/6;
    return v2;
}

vec2 drawBar90(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) {
        v2.x = 0.166-(2*vtexCoord.x) - float(image-x + 4)/6;
        v2.y = -v2.y;
    }
    return v2;
}

vec2 drawBar180(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) {
        v2.x = 2*(vtexCoord.x) + float(image-x)/6;
        v2.y = -v2.y;
    }
    return v2;
}

vec2 drawBar270(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) {
        v2.x = 0.166-(2*(vtexCoord.x) - float(image-x)/6);
    }
    return v2;
}

vec2 drawBarVerticalMirror(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) {
        v2.y = 2*(vtexCoord.x);
        v2.x = v2.y + float(image - x + 1)/6;
    }
    return v2;
}

vec2 drawBarVerticalMirror2(int x, int y, vec2 v2, int image) {
    if (vtexCoord.y < float(y+1)/12 && vtexCoord.y > float(y)/12 &&vtexCoord.x > float(x)/12 && vtexCoord.x < float(x+1)/12) {
        v2.y = 2*(1-vtexCoord.x);
        v2.x = v2.y + float(4)/6;
    }
    return v2;
}

void main()
{
    vec2 v2 = vtexCoord;
    v2 *= 12;
    v2.x /= 6;

    for (int i = 0; i < 12; ++i) for (int j = 0; j < 12; ++j) {
        if (j == 0 && i == 0) v2 = drawBar90(i,j,v2, 4);
        else if (j == 11 && i == 0) v2 = drawBar270(i,j,v2, 4);
        else if (j == 0 && i == 11) v2 = drawBar180(i,j,v2, 4);
        else if (j == 11 && i == 11) v2 = drawBar(i,j,v2, 4);
        else if (j == 0 || j == 11) v2 = drawBar(i,j,v2, 3);
        else if (i == 0) v2 = drawBarVerticalMirror(i, j, v2, 3);
        else if (i == 11) v2 = drawBarVerticalMirror2(i, j, v2, 3);
        else if (i%2 != 0 && j%3 != 0) v2 = drawBar(i, j, v2, 3);
        else {
            if (i == 2 && j == 6) v2 = drawBar(i,j,v2, 1);
            else if (i == 2 && j == 5) v2 = drawBar(i,j,v2, 0);
            else if (i == 7 && j == 3) v2 = drawBar(i,j,v2, 0);
            else v2 = drawBar(i, j, v2, 5);
        }
    }
    fragColor = texture(colormap, v2);
    fragColor *= fragColor[3];
}
