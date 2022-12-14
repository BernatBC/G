#include "modelInfo1.h"
#include "glwidget.h"

//número total de polígons i el percentatge de polígons que són triangles

void ModelInfo1::onPluginLoad()
{
	calculateInfo();
}

void ModelInfo1::preFrame()
{
	
}

void ModelInfo1::postFrame()
{
	
}

void ModelInfo1::onObjectAdd()
{
	calculateInfo();
}

bool ModelInfo1::drawScene()
{
	return false; // return true only if implemented
}

bool ModelInfo1::drawObject(int)
{
	return false; // return true only if implemented
}

bool ModelInfo1::paintGL()
{
	return false; // return true only if implemented
}

void ModelInfo1::keyPressEvent(QKeyEvent *)
{
	
}

void ModelInfo1::mouseMoveEvent(QMouseEvent *)
{
	
}

void ModelInfo1::calculateInfo() {
	vector<Object> o = scene()->objects();
	int objectes = o.size();
	int vertices = 0;
	int faces = 0;
	int triangles = 0;
	for (int i = 0; i < objectes; ++i) {
		vertices += o[i].vertices().size();
		vector<Face> f = o[i].faces();
		faces += f.size();
		for (int j = 0; j < f.size(); ++j) if (f[j].numVertices() == 3) ++triangles;
	}
	cout << "Objectes: " << objectes << " Poligons: " << faces << " Vertexs: " << vertices << " Percentatge triangles: " << 100*float(triangles)/faces << endl;
}

