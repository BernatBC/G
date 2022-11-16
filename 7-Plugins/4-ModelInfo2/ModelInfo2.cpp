#include "ModelInfo2.h"
#include "glwidget.h"

void ModelInfo2::onPluginLoad()
{
	calculateInfo();
}

void ModelInfo2::preFrame()
{
	
}

void ModelInfo2::postFrame()
{
	QFont font;
	font.setPixelSize(24);
	painter.begin(glwidget());
	painter.setFont(font);
	painter.setPen(Qt::black);
	int x = 15;
	int y = 40;
	string s1 = "Objectes: " + to_string(objectes);
	string s2 = "Poligons: " + to_string(faces);
	string s3 = "Vertexs: " + to_string(vertices);
	string s4 = "Triangles: " + to_string(100*float(triangles)/faces) + "%";
	painter.drawText(x, y, QString::fromStdString(s1));
	painter.drawText(x, y + 40, QString::fromStdString(s2));
	painter.drawText(x, y + 80, QString::fromStdString(s3));
	painter.drawText(x, y + 120, QString::fromStdString(s4));
	painter.end();
}

void ModelInfo2::onObjectAdd()
{
	calculateInfo();
}

bool ModelInfo2::drawScene()
{
	return false; // return true only if implemented
}

bool ModelInfo2::drawObject(int)
{
	return false; // return true only if implemented
}

bool ModelInfo2::paintGL()
{
	return false; // return true only if implemented
}

void ModelInfo2::keyPressEvent(QKeyEvent *)
{
	
}

void ModelInfo2::mouseMoveEvent(QMouseEvent *)
{
	
}

void ModelInfo2::calculateInfo() {
	vector<Object> o = scene()->objects();
	objectes = o.size();
	vertices = 0;
	for (int i = 0; i < objectes; ++i) {
		vertices += o[i].vertices().size();
	}
	faces = 0;
	triangles = 0;
	for (int i = 0; i < objectes; ++i) {
		vector<Face> f = o[i].faces();
		faces += f.size();
		for (int j = 0; j < f.size(); ++j) if (f[j].numVertices() == 3) ++triangles;
	}
}