#include "isafloor.h"
#include "glwidget.h"
#include <cmath>

void Isafloor::onPluginLoad()
{
	vector<Object> o = scene()->objects();
	int objectes = o.size();
	float totalSurface = 0;
	float floorSurface = 0;
	for (int j = 0; j < objectes; ++j) {
		vector<Face> f = o[j].faces();
		vector<Vertex> vertex = o[j].vertices();
		for (int i = 0; i < f.size(); ++i) {
			Vector a = f[i].normal();
			//Calculra superficie cara
			//Producte escalar -> saber si la cara és floor o no
			Vector b {0, 0, 1};
			float product = a[0]*b[0] + a[1]*b[1] + a[2]*b[2];
			float face_surface = surface(vertex[f[i].vertexIndex(0)].coord(), vertex[f[i].vertexIndex(1)].coord(), vertex[f[i].vertexIndex(2)].coord());
			if (product >= 0.7) floorSurface += face_surface;
			totalSurface += face_surface;
		}
	}
	GLWidget & g = *glwidget();
    g.makeCurrent();
    // Carregar shader, compile & link 
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile(g.getPluginPath()+"/../isafloor/isafloor.vert");

    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile(g.getPluginPath()+"/../isafloor/isafloor.frag");

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
	program->setUniformValue("lambda", floorSurface/totalSurface);
	surface_realtion = floorSurface/totalSurface;
	std::cout << "Superficie total: " << totalSurface << " Superficie terra: " << floorSurface << " Relacio: " << floorSurface/totalSurface << std::endl;
}

float Isafloor::surface(Point vertex1, Point vertex2, Point vertex3) {
	Vector u = vertex1 - vertex2;
	Vector v = vertex1 - vertex3;
	Vector cross;
	cross[0] = u[1] * v[2] - u[2] * v[1];
   	cross[1] = -(u[0] * v[2] - u[2] *v[0]);
   	cross[2] = u[0] * v[1] - u[1] * v[0];
	float module = sqrt(cross[0]*cross[0] + cross[1]*cross[1] + cross[2]*cross[2]);
	return module/2;
}

void Isafloor::preFrame()
{
	program->bind();
  QMatrix3x3 NM=camera()->viewMatrix().normalMatrix();
  program->setUniformValue("normalMatrix", NM); 
  QMatrix4x4 MVP = camera()->projectionMatrix() * camera()->viewMatrix();
  program->setUniformValue("lambda", surface_realtion);
  program->setUniformValue("modelViewProjectionMatrix", MVP);	
}

void Isafloor::postFrame()
{
	program->release();
}

void Isafloor::onObjectAdd()
{
	onPluginLoad();
}

bool Isafloor::drawScene()
{
	return false; // return true only if implemented
}

bool Isafloor::drawObject(int)
{
	return false; // return true only if implemented
}

bool Isafloor::paintGL()
{
	return false; // return true only if implemented
}

void Isafloor::keyPressEvent(QKeyEvent *)
{
	
}

void Isafloor::mouseMoveEvent(QMouseEvent *)
{
	
}

