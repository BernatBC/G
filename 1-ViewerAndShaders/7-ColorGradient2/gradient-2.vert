#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vtexCoord = texCoord;
    vec4 vertexModel = modelViewProjectionMatrix*vec4(vertex, 1);
    vertexModel /= vertexModel[3];
    if (vertexModel.y < -1) frontColor = vec4(1, 0, 0, 1);
    else if (vertexModel.y < -0.5) frontColor = vec4(mix(vec3(1, 0, 0), vec3(1, 1, 0), fract((vertexModel.y + 1)/0.5)), 1);
    else if (vertexModel.y < 0) frontColor = vec4(mix(vec3(1, 1, 0), vec3(0, 1, 0), fract((vertexModel.y + 0.5)/0.5)), 1);
    else if (vertexModel.y < 0.5) frontColor = vec4(mix(vec3(0, 1, 0), vec3(0, 1, 1), fract((vertexModel.y)/0.5)), 1);
    else if (vertexModel.y < 1) frontColor = vec4(mix(vec3(0, 1, 1), vec3(0, 0, 1), fract((vertexModel.y + 0.5)/0.5)), 1);
    else frontColor = vec4(0, 0, 1, 1);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
