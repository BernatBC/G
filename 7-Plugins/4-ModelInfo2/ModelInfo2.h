#ifndef _MODELINFO2_H
#define _MODELINFO2_H

#include "plugin.h"
#include <vector>
#include <QPainter>
#include <string>

class ModelInfo2: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void preFrame();
	 void postFrame();

	 void onObjectAdd();
	 bool drawScene();
	 bool drawObject(int);

	 bool paintGL();

	 void keyPressEvent(QKeyEvent *);
	 void mouseMoveEvent(QMouseEvent *);
  private:
	// add private methods and attributes here
		int objectes = 0;
	int vertices = 0;
	int faces = 0;
	int triangles = 0;
	QPainter painter;

	void calculateInfo();
	
};

#endif
