#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    vec4 vertexOut = modelViewProjectionMatrix*vec4(vertex, 1);
    vertexOut /= vertexOut[3];
    float angle = sin(time);
    if (angle < 0) angle *= -1;
    angle += 0.5;
    vertexOut.x *= angle;
    vertexOut.y *= angle;
    gl_Position = vertexOut;
}
