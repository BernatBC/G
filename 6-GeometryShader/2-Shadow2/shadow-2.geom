#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 ViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
in vec4 vfrontColor[];
out vec4 gfrontColor;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0);
		gl_Position = modelViewProjectionMatrix*vec4(gl_in[i].gl_Position.x, (boundingBoxMin[1]) , gl_in[i].gl_Position.z, gl_in[i].gl_Position.w);
		EmitVertex();
	}
    EndPrimitive();

	if (gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4(0, 1, 1, 0);
		vec3 C = (boundingBoxMax + boundingBoxMin)/2;
		float R = length(boundingBoxMax - C);

		gfrontColor = vec4(0, 1, 1, 0);
		gl_Position = modelViewProjectionMatrix*vec4(C.x + R, boundingBoxMin.y - 0.01, C.z + R, 1);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix*vec4(C.x - R, boundingBoxMin.y - 0.01, C.z + R, 1);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix*vec4(C.x + R, boundingBoxMin.y - 0.01, C.z - R, 1);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix*vec4(C.x - R, boundingBoxMin.y - 0.01, C.z - R, 1);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix*vec4(C.x - R, boundingBoxMin.y - 0.01, C.z + R, 1);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix*vec4(C.x + R, boundingBoxMin.y - 0.01, C.z - R, 1);
		EmitVertex();
		EndPrimitive();
	}
	
}
