import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.1
import QtQuick.Window 2.2

Page {
    width: screen.width
    height: screen.height

    title: qsTr("Google Dashboard")

    WebEngineView {
        url: "https://myaccount.google.com/dashboard?hl=en&pli=1"
        anchors.fill: parent
    }
}
