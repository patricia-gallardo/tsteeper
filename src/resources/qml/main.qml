import QtQml 2.0
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import QtWebEngine 1.7

import "theme.js" as Theme
import "addresses.js" as Addesses

QtObject {

    property var topLevelWindow: Window {
        id: root

        width: Screen.desktopAvailableWidth
        height: Screen.desktopAvailableHeight

        visible: true

        function getTitle(currentIndex) {
            var current = tabModel.get(currentIndex);
            return current ? current.tabTitle + " - " : "";
        }

        title: getTitle(tabBar.currentIndex) + "tSteeper";

        ListModel {
            id: tabModel
            Component.onCompleted: tabBar.makeNewTab()
        }

        ColumnLayout {

            anchors.fill: parent
            spacing: 0

            TabToolbar {
                id : tabBar
                currentIndex: pagesStack.currentIndex
                model: tabModel
            }

            StackLayout {
                id: pagesStack
                currentIndex: tabBar.currentIndex

                Repeater {
                    id: pages
                    model: tabModel

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ColumnLayout {
                        id: page
                        property alias title: webView.title
                        Layout.fillWidth: true
                        Layout.fillHeight: true
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

                            Component.onCompleted: url = tabUrl

                            onUrlChanged: tabUrl = url
                            onTitleChanged: tabTitle = title

                            function searchUrl(terms) {
                                return Addesses.search + encodeURI(terms);
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
                                    webView.url = Addesses.defaultPrefix + typedText;
                                } else {
                                    webView.url = typedText;
                                }
                            }

                            onLoadingChanged: function(loadRequest) {
                                console.log("Loading changed for request url : " + loadRequest.url);

                                switch(loadRequest.status) {
                                case WebEngineView.LoadStartedStatus: {
                                    console.log("status STARTED");
                                    break;
                                }
                                case WebEngineView.LoadStoppedStatus: {
                                    console.log("status STOPPED");
                                    break;
                                }
                                case WebEngineView.LoadSucceededStatus: {
                                    console.log("status SUCCEEDED");
                                    break;
                                }
                                case WebEngineView.LoadFailedStatus: {
                                    console.log("status FAILED");
                                    console.log("errorCode   : " + loadRequest.errorCode);
                                    console.log("errorString : " + loadRequest.errorString);

                                    switch (loadRequest.errorDomain) {
                                    case WebEngineView.NoErrorDomain : {
                                        console.log("Error Domain NONE");
                                        break;
                                    }
                                    case WebEngineView.InternalErrorDomain : {
                                        console.log("Error Domain INTERNAL");
                                        break;
                                    }
                                    case WebEngineView.ConnectionErrorDomain : {
                                        console.log("Error Domain CONNECTION");
                                        break;
                                    }
                                    case WebEngineView.CertificateErrorDomain : {
                                        console.log("Error Domain CERTIFICATE");
                                        break;
                                    }
                                    case WebEngineView.HttpErrorDomain : {
                                        console.log("Error Domain HTTP");
                                        break;
                                    }
                                    case WebEngineView.FtpErrorDomain : {
                                        console.log("Error Domain FTP");
                                        break;
                                    }
                                    case WebEngineView.DnsErrorDomain : {
                                        console.log("Error Domain DNS");
                                        break;
                                    }
                                    }
                                    break;
                                }
                                }
                            }
                        }

                        Action {
                            shortcut: "Escape"
                            onTriggered: {
                                console.log("Unfocus Address Field");
                                bar.unfocusAddressField()
                            }
                        }

                        Action {
                            shortcut: "F8"
                            onTriggered: {
                                console.log("Focus Address Field");
                                bar.focusAddressField();
                            }
                        }
                    }
                }
            }
        }

        Action {
            shortcut: "Ctrl+T"
            onTriggered: {
                tabBar.makeNewTab();
            }
        }

        Action {
            shortcut: "Ctrl+W"
            onTriggered: {
                tabBar.closeCurrentTab();
            }
        }

        Action {
            shortcut: "F11"
            onTriggered: {
                if (root.visibility == Window.FullScreen) {
                    root.visibility = Window.Maximized
                } else {
                    root.visibility = Window.FullScreen
                }
            }
        }
    }

    property var quitAction: Shortcut {
        sequence: "Ctrl+Q"
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

    property var newWindowAction: Shortcut {
        sequence: "Ctrl+N"
        context: Qt.ApplicationShortcut
        onActivated: console.log("Create new window")
    }
}
