import QtQml 2.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtWebEngine 1.4

Window {
    width: 1920
    height: 1080
    visible: true

    ColumnLayout {
        anchors.fill: parent
        AddressBar {
            id: bar
            Layout.preferredHeight:30
            Layout.fillWidth: true

            url: webView.url

            onBack: webView.goBack();
            onForward: webView.goForward();
            onGoToAddress: webView.typedText = address;
        }

        WebEngineView {
            id: webView
            Layout.fillWidth: true
            Layout.fillHeight: true

            property string typedText: ""

            function searchUrl(terms) {
                return "https://www.google.com/search?q=" + encodeURI(terms);
            }

            function hasWhiteSpace(s) {
                return /\s/g.test(s);
            }

            function hasPeriod(s) {
                return /\./.test(s);
            }

            function hasProtocol(s) {
                return /^(https?|ftp)/.test(s);
            }

            onTypedTextChanged: {
                if (hasWhiteSpace(typedText) || !hasPeriod(typedText)) {
                    webView.url = searchUrl(typedText);
                } else if (!hasProtocol(typedText)) {
                    webView.url = "https://" + typedText;
                } else {
                    webView.url = typedText;
                }
            }

            url: "https://www.youtube.com"
        }
    }
}
