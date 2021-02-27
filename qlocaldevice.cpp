#include <QCoreApplication>
#include "qlocaldevice.h"
#include <unistd.h>
#include <sys/reboot.h>
#include <QtNetwork/QNetworkInterface>

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


bool QLocalDevice::isConnectedToNetwork()
{
    QList<QNetworkInterface> ifaces = QNetworkInterface::allInterfaces();
    bool result = false;

    for (int i = 0; i < ifaces.count(); i++)
    {
        QNetworkInterface iface = ifaces.at(i);
        if ( iface.flags().testFlag(QNetworkInterface::IsUp)
             && !iface.flags().testFlag(QNetworkInterface::IsLoopBack) )
        {

#ifdef DEBUG
            // details of connection
            qDebug() << "name:" << iface.name() << endl
                    << "ip addresses:" << endl
                    << "mac:" << iface.hardwareAddress() << endl;
#endif

            // this loop is important
            for (int j=0; j<iface.addressEntries().count(); j++)
            {
#ifdef DEBUG
                qDebug() << iface.addressEntries().at(j).ip().toString()
                        << " / " << iface.addressEntries().at(j).netmask().toString() << endl;
#endif

                // we have an interface that is up, and has an ip address
                // therefore the link is present

                // we will only enable this check on first positive,
                // all later results are incorrect
                if (result == false)
                    result = true;
            }
        }

    }

    return result;
}
