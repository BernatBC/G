#include "ShowDegree.h"
#include "glwidget.h"

void ShowDegree::onPluginLoad()
{
	int v = scene()->objects()[0].vertices().size();
	int f = scene()->objects()[0].faces().size();
	value = 3*float(f)/v;
}

void ShowDegree::preFrame()
{
	
}

void ShowDegree::postFrame()
{
	QFont font;
	font.setPixelSize(32);
	painter.begin(glwidget());
	painter.setFont(font);
	painter.setPen(Qt::black);
	int x = 15;
	int y = 40;
	painter.drawText(x, y, QString::number(value));
	painter.end();
}

void ShowDegree::onObjectAdd()
{
	
}

bool ShowDegree::drawScene()
{
	return false; // return true only if implemented
}

bool ShowDegree::drawObject(int)
{
	return false; // return true only if implemented
}

bool ShowDegree::paintGL()
{
	return false; // return true only if implemented
}

void ShowDegree::keyPressEvent(QKeyEvent *)
{
	
}

void ShowDegree::mouseMoveEvent(QMouseEvent *)
{
	
}

