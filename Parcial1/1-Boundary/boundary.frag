#version 330 core

in vec3 P;
in vec3 N;
out vec4 fragColor;

uniform float edge0 = 0.35;
uniform float edge1 = 0.4;

void main()
{
    float c = dot(normalize(N) , -normalize(P));
    fragColor = vec4(smoothstep(edge0, edge1, c));
}
