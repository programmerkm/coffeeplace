#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qtwebengineglobal.h>
#include "qlocaldevice.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QCoreApplication::setOrganizationName("CoffeePlace");
    //register our form processor class as singleton as we dont want to create memory overheads
      QScopedPointer<QLocalDevice> singletonprocessor(new QLocalDevice);
      qmlRegisterSingletonInstance("com.company.localdevice", 1, 0, "LocalDevice", singletonprocessor.get()); //register our singleton


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QtWebEngine::initialize();
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
