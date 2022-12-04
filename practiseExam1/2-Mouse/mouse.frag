#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int mode = 2;

bool insideCircle(float cx, float cy, float r) {
	float x = vtexCoord.x - cx;
	float y = vtexCoord.y - cy;
	return sqrt(x*x + y*y) < r;
}

bool insideElipse(float cx, float cy, float sx, float sy, float r) {
	float x = vtexCoord.x - cx;
	float y = vtexCoord.y - cy;
	return sqrt(x*x*sx + y*y*sy) < r;
}

void main()
{
	fragColor = vec4(0.8);
	if (mode >= 0) {
		if(insideCircle(0.5,0.4,0.35) || insideCircle(0.2,0.8,0.2) || insideCircle(0.8,0.8,0.2)) fragColor = vec4(0);
		if (mode >= 1) {
			if(insideElipse(0.45, 0.5, 0.9, 0.3, 0.1) || insideElipse(0.55, 0.5, 0.9, 0.3, 0.1) 
			|| insideElipse(0.5, 0.3, 0.11, 0.5, 0.1)) fragColor = vec4(1, 0.8, 0.6, 1);
			if (mode == 2) {
				if(insideElipse(0.45, 0.5, 2, 0.5, 0.1) || insideElipse(0.55, 0.5, 2, 0.5, 0.1) 
					) fragColor = vec4(1);
				if(insideElipse(0.46, 0.45, 8, 2, 0.1) || insideElipse(0.54, 0.45, 8, 2, 0.1) 
					) fragColor = vec4(0);
			}
		}
	}
    
}
