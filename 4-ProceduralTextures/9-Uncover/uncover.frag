#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform float time;
uniform mat4 modelViewProjectionMatrix;
void main()
{
    float t = 1;
    if ((modelViewProjectionMatrix*gl_FragCoord).x/500 > time) discard;
    fragColor = frontColor;
}
