#ifndef QLOCALDEVICE_H
#define QLOCALDEVICE_H

#include <qobject.h>
#include <qdebug.h>

class QLocalDevice : public QObject
{
    Q_OBJECT

public:
    QLocalDevice(QObject *parent = Q_NULLPTR);
    ~QLocalDevice();
    Q_INVOKABLE bool postMessage(const QString &msg) {
            qDebug() << "Called the C++ method with" << msg;
            return true;
        }

public Q_SLOTS:
    void reboot();
    void powerOff();
    void terminal();
};

#endif // QLOCALDEVICE_H
