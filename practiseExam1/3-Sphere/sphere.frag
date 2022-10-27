#version 330 core

in vec2 vtexCoord;
in vec4 frontColor;
in vec3 vertexEye;
in vec3 N;
out vec4 fragColor;

uniform int mode = 2;
uniform mat3 normalMatrix;

uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;

bool insideSphere(float x, float y, float cx, float cy) {
	float rx = x-cx;
	float ry = y-cy;
	if (sqrt(rx*rx + ry*ry) <= 1) return true;
	return false;
}

void main()
{
	if (mode >= 0) {
		fragColor = vec4(0);
		
		if (!insideSphere(vtexCoord.x, vtexCoord.y, 0.5, 0.5)) {
			discard;
		}
		if (mode >= 1) {
			float vX = vtexCoord.x - 0.5, vY = vtexCoord.y - 0.5;
			float Nz = sqrt(1 - vX*vX - vY*vY);
			fragColor = vec4(vec3(Nz), Nz);
			if (mode == 2) {
				vec3 L = vec3(lightPosition);
    			if (lightPosition[3] != 0) L -= vertexEye;
    			L = normalize(L);
    			vec3 V = normalize(-vertexEye);
    			vec3 R = normalize(2*dot(N, L)*N-L);
    			fragColor = matAmbient*lightAmbient + matDiffuse*lightDiffuse*max(0.0, dot(N, L));
    			if (dot(N, L) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0.0, dot(R, V)), matShininess);
			}
		}
	}
}
