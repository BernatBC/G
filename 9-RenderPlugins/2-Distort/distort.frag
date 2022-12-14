#version 330 core
out vec4 fragColor;

uniform sampler2D colorMap;

uniform float SIZE;
uniform float time;

const int W = 4; // filter size: 2W*2W

void main()
{
    vec2 st = (gl_FragCoord.xy - vec2(0.5)) / SIZE;
    st.y += 0.01*sin(10.0*time + 30.0*st.x);
    fragColor = texture2D(colorMap, st);
    
}

