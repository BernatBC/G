#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform float time;
uniform bool eyespace;
const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    float d;
    if (!eyespace) d = (distance(boundingBoxMax, boundingBoxMin)/20)*vertex.y;
    else {
        vec4 vertexOut = modelViewMatrix * vec4(vertex, 1.0);
        d = (distance(boundingBoxMax, boundingBoxMin)/20)*vertexOut.y;
    }
    float dist = d*sin(time);
    vec3 vertexOut = vec3(vertex.x + dist*normal.x, vertex.y + dist*normal.y, vertex.z + dist*normal.z); 
    gl_Position = modelViewProjectionMatrix * vec4(vertexOut, 1.0);
}
