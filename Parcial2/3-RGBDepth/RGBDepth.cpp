#include "RGBDepth.h"
#include "glwidget.h"

#include <QCoreApplication>

const int IMAGE_WIDTH = 1024;
const int IMAGE_HEIGHT = IMAGE_WIDTH;

void RGBDepth::onPluginLoad()
{
    GLWidget & g = *glwidget();
    g.makeCurrent();
    // Carregar shader, compile & link 
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile(g.getPluginPath()+"/../RGBDepth/RGBDepth.vert");

    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile(g.getPluginPath()+"/../RGBDepth/RGBDepth.frag");

	vs2 = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs2->compileSourceFile(g.getPluginPath()+"/../RGBDepth/SplitView.vert");

    fs2 = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs2->compileSourceFile(g.getPluginPath()+"/../RGBDepth/SplitView.frag");

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();

    // Setup texture
    g.glActiveTexture(GL_TEXTURE0);
    g.glGenTextures( 1, &textureId);
    g.glBindTexture(GL_TEXTURE_2D, textureId);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,
		      GL_LINEAR_MIPMAP_LINEAR );
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
    g.glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, IMAGE_WIDTH, IMAGE_HEIGHT,
		   0, GL_RGB, GL_FLOAT, NULL);
    g.glBindTexture(GL_TEXTURE_2D, 0);
    // Resize to power-of-two viewport
    g.resize(IMAGE_WIDTH,IMAGE_HEIGHT);
}

// draws a quad with vertices V0, V1, V2, V3. 
void drawRect(GLWidget &g, Point V0, Point V1, Point V2, Point V3)
{
	GLuint VAO_rect;

    // 1. Create VAO
    // Create & bind empty VAO
    g.glGenVertexArrays(1, &VAO_rect);
    g.glBindVertexArray(VAO_rect);

    // Create VBO with (x,y,z) coordinates
    float coords[] = { V0.x(), V0.y(), V0.z(),
                       V1.x(), V1.y(), V1.z(),
					   V3.x(), V3.y(), V3.z(),
					   V2.x(), V2.y(), V2.z() };

    GLuint VBO_coords;
    g.glGenBuffers(1, &VBO_coords);
    g.glBindBuffer(GL_ARRAY_BUFFER, VBO_coords);
    g.glBufferData(GL_ARRAY_BUFFER, sizeof(coords), coords, GL_STATIC_DRAW);
    g.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
    g.glEnableVertexAttribArray(0);
    g.glBindVertexArray(0);

    // 2. Draw
    g.glBindVertexArray (VAO_rect);
    g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    g.glBindVertexArray(0);

	// 3. Clean up
	g.glDeleteBuffers(1, &VBO_coords);
	g.glDeleteVertexArrays(1, &VAO_rect);
}



bool RGBDepth::paintGL()
{
    GLWidget & g = *glwidget();
    // Pass 1. Draw scene
    g.glClearColor(0,0,0,0);
    g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
    if (drawPlugin()) drawPlugin()->drawScene();

	g.defaultProgram()->setUniformValue("modelViewProjectionMatrix", 	
	camera()->projectionMatrix() * camera()->viewMatrix() );
	program->setUniformValue("normalMatrix", camera()->viewMatrix().normalMatrix());
	if (drawPlugin()) drawPlugin()->drawScene();

    // Get texture
    g.glBindTexture(GL_TEXTURE_2D, textureId);
    g.glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0,
			  IMAGE_WIDTH, IMAGE_HEIGHT);
    g.glGenerateMipmap(GL_TEXTURE_2D);


	//SÓC CONSCIENT QUE FALTA ENLLAÇAR ELS SHADERS SplitView

	/*program->addShader(vs2);
    program->addShader(fs2);
    program->link();*/

	g.glClearColor(0,0,0,0);
	g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

	//Quadrat 1
    program->bind();
    program->setUniformValue("colorMap", 0);
    program->setUniformValue("SIZE", float(IMAGE_WIDTH));  
    program->setUniformValue("display", 2);  

	g.glBindTexture(GL_TEXTURE_2D, textureId);
	Point V0 = Point(0, 0, 0);
	Point V1 = Point(0.5, 0, 0);
	Point V2 = Point(0.5, 0.5, 0);
	Point V3 = Point(0, 0.5, 0);
    drawRect(g, V0, V1, V2, V3);

	//Quadrat 2
    program->bind();
    program->setUniformValue("colorMap", 0);
    program->setUniformValue("SIZE", float(IMAGE_WIDTH));  
    program->setUniformValue("display", 1);  

	g.glBindTexture(GL_TEXTURE_2D, textureId);
	V0 = Point(0.5, 0.5, 0);
	V1 = Point(1, 0.5, 0);
	V2 = Point(1, 1, 0);
	V3 = Point(0.5, 1, 0);
    drawRect(g, V0, V1, V2, V3);

	//Quadrat 3
    program->bind();
    program->setUniformValue("colorMap", 0);
    program->setUniformValue("SIZE", float(IMAGE_WIDTH));  
    program->setUniformValue("display", 0);  

	g.glBindTexture(GL_TEXTURE_2D, textureId);
	V0 = Point(0, 0.5, 0);
	V1 = Point(0, 1, 0);
	V2 = Point(0.5, 1, 0);
	V3 = Point(0.5, 0.5, 0);
    drawRect(g, V0, V1, V2, V3);

	//Quadrat 4
    program->bind();
    program->setUniformValue("colorMap", 0);
    program->setUniformValue("SIZE", float(IMAGE_WIDTH));  
    program->setUniformValue("display", 3);  

	g.glBindTexture(GL_TEXTURE_2D, textureId);
	V0 = Point(0.5, 0, 0);
	V1 = Point(0.5, 0.5, 0);
	V2 = Point(1, 0.5, 0);
	V3 = Point(1, 0, 0);
    drawRect(g, V0, V1, V2, V3);

	// restore state
    g.defaultProgram()->bind();
    g.glBindTexture(GL_TEXTURE_2D, 0);

    return true;
}
