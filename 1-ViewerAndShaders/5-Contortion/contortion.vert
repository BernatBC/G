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
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    float A = 0;
    if (vertex.y > 0.5) A = (vertex.y - 0.5)*sin(time);;
    mat3 rotation = mat3(vec3(1, 0, 0), vec3(0, cos(A), sin(A)), vec3(0, -sin(A), cos(A)));
    vec3 vertexOut = vertex;
    vertexOut.y -= 1;
    vertexOut = rotation*vertexOut;
    vertexOut.y += 1;
    gl_Position = modelViewProjectionMatrix * vec4(vertexOut, 1.0);
}
