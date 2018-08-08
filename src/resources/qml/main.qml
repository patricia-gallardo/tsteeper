import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebEngine 1.0

Window {
    width: 1920
    height: 1080
    visible: true

    Column {
        anchors.fill: parent
        AddressBar {
            id: bar
            width: parent.width
            height: 30

            url: webView.url

            onBack: webView.goBack();
            onForward: webView.goForward();
            onGoToAddress: webView.url = address;
        }

        WebEngineView {
            id: webView
            width: parent.width
            height: parent.height - bar.height
            url: "https://www.youtube.com"
        }
    }
}
