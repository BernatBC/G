#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vtexCoord = texCoord;
    float dist = boundingBoxMax.y - boundingBoxMin.y;
    float posy = 4*(vertex.y - boundingBoxMin.y)/dist;
    float fracted = fract(posy);
    //if (fracted == 0) fracted = 1;
    if (posy < 1) frontColor = vec4(vec3(mix(vec3(1, 0, 0), vec3(1, 1, 0), fracted)), 1.0);
    else if (posy < 2) frontColor = vec4(vec3(mix(vec3(1, 1, 0), vec3(0, 1, 0), fracted)), 1.0);
    else if (posy < 3) frontColor = vec4(vec3(mix(vec3(0, 1, 0), vec3(0, 1, 1), fracted)), 1.0);
    else if (posy < 4) frontColor = vec4(vec3(mix(vec3(0, 1, 1), vec3(0, 0, 1), fracted)), 1.0);
    else frontColor = vec4(0, 0, 1, 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
