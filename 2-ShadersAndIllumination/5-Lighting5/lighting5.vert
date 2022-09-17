#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 n;
out vec3 l;
out vec3 v;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightPosition; // similar a gl_LightSource[0].position

uniform bool world;

void main()
{
    if (world) {
        n = normalize(normal);
        l = vec3(lightPosition);
        if (lightPosition[3] != 0) l -= vertex;
        l = normalize(l);
        v = normalize(-vertex);
    }
    else {
        vec3 vertexEye = vec3(modelViewMatrix*vec4(vertex, 1));
        n = normalize(normalMatrix * normal);
        l = vec3(lightPosition);
        if (lightPosition[3] != 0) l -= vertexEye;
        l = normalize(l);
        v = normalize(-vertexEye);
    }
    vec3 vertexEye = vec3(modelViewMatrix*vec4(vertex, 1));
    n = normalize(normalMatrix * normal);
    l = vec3(lightPosition);
    if (lightPosition[3] != 0) l -= vertexEye;
    l = normalize(l);
    v = normalize(-vertexEye);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
