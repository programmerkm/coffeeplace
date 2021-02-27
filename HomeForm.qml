import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2

Page {
    width: screen.width
    height: screen.height
    title: qsTr("Home")

    WebEngineView {
        id:homepagewebengine
        url: "https://dakboard.com/app?p=1a90cc0599c6a92cd8635b54142f031f"
        anchors.fill: parent

        onContextMenuRequested: {
             request.accepted = true;
         }

        onLoadingChanged: function(loadRequest) {
            if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
                busy.running = true
                showTimer.start()
            }
        }

        Timer {
            id: showTimer
            interval: 500
            repeat: false
            onTriggered: {
                homepagewebengine.show(true)
            }
        }

        Rectangle {
            id: webViewPlaceholder
            anchors.fill: parent
            z: 1
            color: "white"

            BusyIndicator {
                id: busy
                anchors.centerIn: parent
            }
        }

        function show(show) {
            if (show === true) {
                busy.running = false
                webViewPlaceholder.visible = false
            } else {
                webViewPlaceholder.visible = true
                busy.running = true
            }
        }
    }
}
