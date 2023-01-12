#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
out vec2 gtexCoord;

uniform float size = 0.07;
uniform float depth = -0.01;

void main( void )
{
	vec4 pos1;
	vec4 pos2;
	vec4 pos3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gtexCoord = vec2(-1, -1);
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		if (i == 0) pos1 = gl_in[i].gl_Position;
		else if (i == 1) pos2 = gl_in[i].gl_Position;
		else if (i == 2) pos3 = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	vec4 C = vec4((pos1 + pos2 + pos3)/3);
	C /= C.w;
	
	gtexCoord = vec2(7, 7);
	gl_Position = vec4(C.x + size, C.y + size, C.z + depth, 1);
	EmitVertex();
	gtexCoord = vec2(7, 0);
	gl_Position = vec4(C.x + size, C.y - size, C.z + depth, 1);
	EmitVertex();
	gtexCoord = vec2(0, 7);
	gl_Position = vec4(C.x - size, C.y + size, C.z + depth, 1);
	EmitVertex();
	EndPrimitive();

	gtexCoord = vec2(0, 0);
	gl_Position = vec4(C.x - size, C.y - size, C.z + depth, 1);
	EmitVertex();
	gtexCoord = vec2(7, 0);
	gl_Position = vec4(C.x + size, C.y - size, C.z + depth, 1);
	EmitVertex();
	gtexCoord = vec2(0, 7);
	gl_Position = vec4(C.x - size, C.y + size, C.z + depth, 1);
	EmitVertex();
	EndPrimitive();
}
