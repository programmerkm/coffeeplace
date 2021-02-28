import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Window 2.2
import com.company.localdevice 1.0


ApplicationWindow {
    id: app
    width: screen.width
    height: screen.height
    visible: true
    title: qsTr("Coffee Place V1.0")

    function reboot()
    {
        LocalDevice.reboot()
    }

    function powerOff()
    {
        LocalDevice.powerOff()
    }

    function terminal()
    {
        LocalDevice.terminal()
    }

    header: ToolBar {
        contentHeight: AppTheme.iconButtonHeight

        ToolButton {
            id: toolButton
            width: AppTheme.iconButtonWidth
            height:AppTheme.iconButtonHeight
            icon.source: stackView.depth > 1 ? "/images/back.svg" : "/images/raspberry-pi.svg"
            icon.width: AppTheme.iconButtonWidth
            icon.height: AppTheme.iconButtonHeight

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
            font.pixelSize: AppTheme.menuTextSize
        }
    }

    Drawer {
        id: drawer
        width: app.width * 0.55
        height: app.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Slack")
                font.pixelSize:AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/slack.svg"
                onClicked: {
                    stackView.push("Slack.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("YouTube")
                font.pixelSize:AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/youtube.svg"
                onClicked: {
                    stackView.push("YouTube.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Movie Trailers")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/clapperboard.svg"
                onClicked: {
                    stackView.push("Trailers.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("World Radio")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/radio.svg"
                onClicked: {
                    stackView.push("Radio.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Device Management")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/configuration.svg"
                onClicked: {
                    stackView.push("Device.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("About CoffeePlace")
                font.pixelSize: AppTheme.menuTextSize
                width: parent.width
                icon.source: "/images/configuration.svg"
                onClicked: {
                    stackView.push("About.qml")
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
        y: app.height
        width: app.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: app.height - inputPanel.height
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
