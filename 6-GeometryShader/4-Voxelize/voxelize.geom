#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float step = 0.2;
uniform mat3 normalMatrix;

void renderizeCube(vec3 C) {
  //Davant
  vec3 N=normalMatrix*vec3(0, 0, 1);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, 0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, 0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, 0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, 0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, -0.5, 0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, 0.5)*step, 1);
  EmitVertex();
  EndPrimitive();

  //Darrere
  N=normalMatrix*vec3(0, 0, -1);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  EndPrimitive();

  //Esquerra
  N=normalMatrix*vec3(-1, 0, 0);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, +0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();

  //Dreta
  N=normalMatrix*vec3(1, 0, 0);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, -0.5, +0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();

  //Dalt
  N=normalMatrix*vec3(0, 1, 0);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, +0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();

  //Baix
  N=normalMatrix*vec3(0, -1, 0);
  gfrontColor=vec4(0.8)*N.z;
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, +0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, -0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(-0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, -0.5, -0.5)*step, 1);
  EmitVertex();
  gl_Position=modelViewProjectionMatrix*vec4(C + vec3(+0.5, -0.5, +0.5)*step, 1);
  EmitVertex();
  EndPrimitive();
}

void main( void )
{
	vec4 centre = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3;
	centre/=step;
    centre.x=int(centre.x);
    centre.y=int(centre.y);
    centre.z=int(centre.z);
    centre*=step;
    renderizeCube(centre.xyz);
}