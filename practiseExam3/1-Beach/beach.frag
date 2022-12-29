#version 330 core

in vec4 frontColor;
in vec3 N;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D window;       //interior
uniform sampler2D palm1;        //palm‐tree
uniform sampler2D background2;  //dunes
uniform float time;

void main()
{
    fragColor = texture(window, vtexCoord);
    if (fragColor.w < 1) {
        vec2 D = vtexCoord + 0.25*N.xy + vec2(0.1*sin(2*time)*vtexCoord.t, 0);
        fragColor = texture(palm1, D);
        if (fragColor.w < 0.5) fragColor = texture(background2, vtexCoord + 0.5*N.xy);
    }
}
