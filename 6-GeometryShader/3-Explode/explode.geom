#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 N[];
out vec4 gfrontColor;

uniform const float speed = 0.5;
uniform float time;
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	vec3 avg = (N[0] + N[1] + N[2])/3;
	vec3 translacio = speed*time*avg;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position + vec4(translacio, 0));
		EmitVertex();
	}
    EndPrimitive();
}
