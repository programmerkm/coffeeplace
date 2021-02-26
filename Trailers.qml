import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2

Page {
    width: screen.width
    height: screen.height

    title: qsTr("IMDB Trailers")

    WebEngineView {
        url: "https://www.imdb.com/trailers/"
        anchors.fill: parent
    }
}
