#version 330 core

in vec4 frontColor;
in vec3 normaleye;
out vec4 fragColor;

uniform mat3 normalMatrix;

void main()
{
    vec3 n = normalize(normalMatrix*normaleye);
    fragColor = frontColor*n.z;
}
