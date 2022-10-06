#version 330 core

in vec4 frontColor;
in vec3 vertCoord;
out vec4 fragColor;

uniform mat4 modelViewProjectionMatrix;

void main()
{
    vec3 vert = vec3(modelViewProjectionMatrix*vec4(vertCoord, 1));
    float N = (normalize(cross(dFdx(vert), dFdy(vert)))).z;
    fragColor = frontColor*N;
}
