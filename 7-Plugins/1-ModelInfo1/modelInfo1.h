#ifndef _MODELINFO1_H
#define _MODELINFO1_H

#include "plugin.h"
#include <vector>

class ModelInfo1: public QObject, public Plugin
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

	void calculateInfo();
};

#endif
