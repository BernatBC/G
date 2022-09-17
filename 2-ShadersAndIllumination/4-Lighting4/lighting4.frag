#version 330 core

in vec4 frontColor;
in vec3 N;
in vec3 vertexEye;
out vec4 fragColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient; // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
// (sempre estarà en eye space)
uniform vec4 matAmbient; // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular; // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

void main()
{
    vec3 L = vec3(lightPosition);
    if (lightPosition[3] != 0) L -= vertexEye;
    L = normalize(L);
    vec3 V = normalize(-vertexEye);
    vec3 R = normalize(2*dot(N, L)*N-L);
    fragColor = matAmbient*lightAmbient + matDiffuse*lightDiffuse*max(0.0, dot(N, L));
    if (dot(N, L) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0.0, dot(R, V)), matShininess);
}
