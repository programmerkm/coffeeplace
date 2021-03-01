import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2

Page {
    width: screen.width
    height: screen.height

    title: qsTr("Timer")

    WebEngineView {
        url: "qrc:/pomodoro-clock/dist/index.html"
        anchors.fill: parent

        onContextMenuRequested: {
             request.accepted = true;
         }
    }
}
