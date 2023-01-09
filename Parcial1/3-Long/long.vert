#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float t = 0.4;
uniform float scale = 4.0;
uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    float c = mix(boundingBoxMin.y, boundingBoxMax.y, t);
    vec3 vertex2 = vertex;
    if (vertex2.y <= c) {
        vertex2.y *= scale;
    }
    else {
        vertex2.y += c*scale - c;
    }
    gl_Position = modelViewProjectionMatrix * vec4(vertex2, 1.0);
}
