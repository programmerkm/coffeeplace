#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qtwebengineglobal.h>
#include <QThread>
#include <QNetworkAccessManager>
#include <QTimer>
#include <QObject>
#include <QDebug>

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

    bool internetConnected=false;
    int attempts=0;

    do
    {
        internetConnected = singletonprocessor.get()->isConnectedToNetwork();
        attempts++;
    }
    while(!internetConnected && attempts <= 5);

    if(!internetConnected)
    {
        qDebug() << "No internet connection found. Attempts :" << attempts;
    }
    else
    {
        qDebug() << "Internet connected";
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}


