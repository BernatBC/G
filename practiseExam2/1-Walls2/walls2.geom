#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin, boundingBoxMax;

void renderizeCube(vec3 C) {
  //Davant
  vec3 N=normalMatrix*vec3(0, 0, 1);
  /*gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMax.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, +boundingBoxMax.y, boundingBoxMax.y), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, +boundingBoxMax.y, boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMax.y), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, boundingBoxMin.y, boundingBoxMax.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, +boundingBoxMax.y, boundingBoxMax.y), 1);
  EmitVertex();
  EndPrimitive();*/

  //Darrere
  gfrontColor=vec4(0, 0, 1, 1);
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, +boundingBoxMax.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, +boundingBoxMax.y, boundingBoxMin.z), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, +boundingBoxMax.y, boundingBoxMin.z), 1);
  EmitVertex();
  EndPrimitive();

  //Esquerra
  gfrontColor=vec4(1, 0, 0, 1);
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, +boundingBoxMax.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, +boundingBoxMax.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, +boundingBoxMax.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, +boundingBoxMax.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();

  //Dreta
  gfrontColor=vec4(1, 0, 0, 1);
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, boundingBoxMin.y, +boundingBoxMax.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, +boundingBoxMax.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, +boundingBoxMax.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMax.x, +boundingBoxMax.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();

  //Dalt
  /*N=normalMatrix*vec3(0, 1, 0);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin, +boundingBoxMax, boundingBoxMin), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin, +boundingBoxMax, +boundingBoxMax), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax, +boundingBoxMax, +boundingBoxMax), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin, +boundingBoxMax, boundingBoxMin), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax, +boundingBoxMax, boundingBoxMin), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax, +boundingBoxMax, +boundingBoxMax), 1);
  EmitVertex();
  EndPrimitive();*/

  //Baix
  gfrontColor=vec4(0, 1, 0, 1)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, +boundingBoxMax.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, boundingBoxMin.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z), 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+boundingBoxMax.x, boundingBoxMin.y, +boundingBoxMax.z), 1);
  EmitVertex();
  EndPrimitive();
}

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	if (gl_PrimitiveIDIn == 0) renderizeCube(vec3(0));
}
