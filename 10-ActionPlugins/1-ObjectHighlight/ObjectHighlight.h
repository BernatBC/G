#ifndef _OBJECTHIGHLIGHT_H
#define _OBJECTHIGHLIGHT_H

#include "plugin.h" 

class ObjectHighlight: public QObject, public Plugin
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
	    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
    
    bool created;
    GLuint cubeVAO;
    GLuint verticesVBO;
    GLuint colorVBO;
};

#endif
