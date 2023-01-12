#version 330 core

in vec4 gfrontColor;
in vec2 gtexCoord;
out vec4 fragColor;

void main()
{
    if (gtexCoord.x >= 0 && gtexCoord.y >= 0 && gtexCoord.x <= 7 && gtexCoord.y <= 7) {
        if (gtexCoord.x >= 2 && gtexCoord.y >= 1 && gtexCoord.x <= 3 && gtexCoord.y <= 6) fragColor = vec4(0);
        else if (gtexCoord.x >= 3 && gtexCoord.y >= 3 && gtexCoord.x <= 4 && gtexCoord.y <= 4) fragColor = vec4(0);
        else if (gtexCoord.x >= 2 && gtexCoord.y >= 5 && gtexCoord.x <= 5 && gtexCoord.y <= 6) fragColor = vec4(0);
        else fragColor = vec4(1, 1, 0, 1);
    }
    else fragColor = gfrontColor;
}
