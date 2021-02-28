import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11

Page {
    width: screen.width
    height: screen.height

    title: qsTr("About CoffeePlace")

    Rectangle {
        id: webViewPlaceholder
        anchors.fill: parent
        color: "white"

        ColumnLayout {
            id: rowLayout
            anchors.centerIn: parent
            spacing: 10

            Column{
                Label{
                    text: "Developer - Kuldeep Mann"
                    font.pixelSize: AppTheme.menuTextSize
                    color: "black"
                }
            }

            Column{
                Label{
                    text: "Please do not forget to visit my youtube channel - Itchy Fingers"
                    font.pixelSize: AppTheme.menuTextSize/2
                    color: "black"
                }
            }

            Column{
                Label{
                    text: "https://everythingembedded.blogspot.com/"
                    font.pixelSize: AppTheme.menuTextSize/2
                    color: "black"
                }
            }

        }
    }
}
