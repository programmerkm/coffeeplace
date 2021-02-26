import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Window 2.2


ApplicationWindow {
    id: window
    width: screen.width
    height: screen.height
    visible: true
    title: qsTr("Coffee Place V1.0")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.55
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("YouTube")
                font.pixelSize:AppTheme.menuTextSize
                width: parent.width
                onClicked: {
                    stackView.push("YouTube.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Movie Trailers")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                onClicked: {
                    stackView.push("Trailers.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Device Management")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                onClicked: {
                    stackView.push("Device.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
