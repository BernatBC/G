#ifndef _RGBDEPTH_H
#define _RGBDEPTH_H

#include "plugin.h"
#include <QOpenGLShader>
#include <QOpenGLShaderProgram>

class RGBDepth: public QObject, public Plugin
{
     Q_OBJECT
     Q_PLUGIN_METADATA(IID "Plugin")   
     Q_INTERFACES(Plugin)

 public:
    void onPluginLoad();
    bool paintGL();
 
 private:
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
	QOpenGLShader* vs2;
    QOpenGLShader* fs2;   
    GLuint textureId;
 };

#endif
