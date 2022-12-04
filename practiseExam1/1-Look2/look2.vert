#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float angle = 0.5;

void main()
{

    vtexCoord = texCoord;
    
    vec4 vertexR = vec4(vertex, 1.0);
    float t;
    
	mat4 matRotacio = mat4(
			 vec4(cos(angle), 0, -sin(angle), 0),
		     vec4(0, 1, 0, 0), 
		     vec4(sin(angle), 0, cos(angle), 0),
		     vec4(0, 0, 0, 1)); 	
    
    if (vertex.y <= 1.45) t = 0;
    else if (vertex.y > 1.45 && vertex.y < 1.55) t = (vertex.y - 1.45)/0.1;		     
    else t = 1;

    vertexR = mix(vertexR, (matRotacio*vertexR), t);

    vec4 normalR = mix(vec4(normal, 1), (matRotacio*vec4(normal, 1)), t);
    vec3 N = normalize(normalMatrix * vec3(normalR));
    frontColor = vec4(vec3(N.z),1);

    gl_Position = modelViewProjectionMatrix * vertexR;
}
