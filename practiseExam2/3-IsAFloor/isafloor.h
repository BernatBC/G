#ifndef _ISAFLOOR_H
#define _ISAFLOOR_H

#include "plugin.h" 
#include <numeric>

class Isafloor: public QObject, public Plugin
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

	 float surface(Vector vertex1, Vector vertex2, Vector vertex3);
  private:
	// add private methods and attributes here
	    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs; 

	float surface_realtion;
};

#endif
