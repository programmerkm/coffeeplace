import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.15

Page {
    ToolBar {
        id: toolBar
        width: parent.width
        anchors.centerIn: parent

        RowLayout {
            id: row
            anchors.fill: parent

            ToolButton {
                id: configButton
                text:"Configure"
                font.pixelSize: AppTheme.iconButtonTextSize
                icon.source: "/images/gears.svg"
                onClicked: app.terminal()
            }

            ToolButton {
                id: terminalButton
                text:"Terminal"
                font.pixelSize: AppTheme.iconButtonTextSize
                icon.source: "/images/terminal.svg"
                onClicked: app.terminal()
            }

            ToolButton {
                id: rebootButton
                text:"Reboot"
                font.pixelSize: AppTheme.iconButtonTextSize
                icon.source: "/images/reboot.svg"
                onClicked: app.reboot()
            }

            ToolButton {
                id: shutdownButton
                text:"Shutdown"
                font.pixelSize: AppTheme.iconButtonTextSize
                icon.source: "/images/ui-power.svg"
                onClicked: app.powerOff()
            }
           }
    }
}
