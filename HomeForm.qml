import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.1
import QtQuick.Window 2.2

Page {
    width: screen.width
    height: screen.height
    title: qsTr("Home")

    WebEngineView {
        url: "https://dakboard.com/app?p=1a90cc0599c6a92cd8635b54142f031f"
        anchors.fill: parent
    }
}
