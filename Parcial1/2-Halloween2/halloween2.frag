#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

float distance() {
    float vx = vtexCoord.x - 0.5;
    float vy = vtexCoord.y - 0.5;
    float d1 = sqrt(0.2 - vx*vx - vy*vy);
    return d1;
}

bool insideElipse(float cx, float cy, float sx, float sy, float r) {
	float x = vtexCoord.x - cx;
	float y = vtexCoord.y - cy;
	return sqrt(x*x*sx + y*y*sy) < r;
}

bool insideSquare(float minx, float maxx, float miny, float maxy) {
    return vtexCoord.x > minx && vtexCoord.x < maxx && vtexCoord.y > miny && vtexCoord.y < maxy;
}

void main()
{
    //Fons negre
    fragColor = vec4(0);
    //Degradat taronja
    fragColor = mix(vec4(0), vec4(1, 0.66, 0, 0), distance());
    //Carbassa elíptica + penducle
    if (!(insideElipse(0.5, 0.48, 0.5, 0.5, 0.13) && !insideElipse(0.5, 0.52, 0.5, 0.5, 0.13))&&!(insideElipse(0.4, 0.58, 0.5, 0.5, 0.055) || insideElipse(0.6, 0.58, 0.5, 0.5, 0.055))&&insideElipse(0.5, 0.5, 0.5, 0.5, 0.2) || insideSquare(0.47, 0.53, 0.7, 0.88)) fragColor = vec4(0.1);
    //Ulls
    //if (insideElipse(0.4, 0.58, 0.5, 0.5, 0.055) || insideElipse(0.6, 0.58, 0.5, 0.5, 0.055)) fragColor = vec4(1, 0.66, 0, 0);
    //Boca
    //if (insideElipse(0.5, 0.48, 0.5, 0.5, 0.13) && !insideElipse(0.5, 0.52, 0.5, 0.5, 0.13)) fragColor = vec4(1, 0.66, 0, 0);
}
