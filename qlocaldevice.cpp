#include <QCoreApplication>
#include "qlocaldevice.h"
#include <unistd.h>
#include <sys/reboot.h>

QLocalDevice::QLocalDevice(QObject *parent)
    : QObject(parent)
{
    qDebug() << "Entering Function Name: " << Q_FUNC_INFO;
}

QLocalDevice::~QLocalDevice()
{
}

/*!
 * Reboots the system. Does not return.
 *
 * \sa powerOff()
 */
void QLocalDevice::reboot()
{
    qDebug() << "Entering Function Name: " << Q_FUNC_INFO;
    sync();
    ::reboot(RB_AUTOBOOT);
    system("reboot");
    qWarning("reboot returned");
}


/*!
 * Shuts down the system. Does not return.
 *
 * \sa reboot()
 */
void QLocalDevice::powerOff()
{
    qDebug() << "Entering Function Name: " << Q_FUNC_INFO;
    sync();
    ::reboot(RB_POWER_OFF);
    system("shutdown now");
    qWarning("powerOff returned");
}

void QLocalDevice::terminal()
{
    qDebug() << "Entering Function Name: " << Q_FUNC_INFO;
    sync();
    QCoreApplication::quit();
    qWarning("terminal returned");
}
