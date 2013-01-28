
/**
 * MeeGo SMS Backup Restore GUI
 * 2013-01-28 Thomas Perl <m@thp.io>
 * Released under the same license terms as the original MeegoSMSBackupRestore.
 **/

import QtQuick 1.1
import com.nokia.meego 1.1

PageStackWindow {
    initialPage: Page {
        Label {
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 20
            }

            text: '<a href="https://github.com/harmattan/MeegoSMSBackupRestore">MeegoSMSBackupRestore</a> on Github'
            onLinkActivated: Qt.openUrlExternally(link)
        }

        Rectangle {
            id: header

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            width: parent.width
            height: 100
            color: '#5a694e'

            Label {
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 20
                }
                color: 'white'
                font.bold: true
                font.pixelSize: 40
                text: 'SMS Backup'
            }
        }

        Column {
            anchors {
                margins: 20
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: header.bottom
            }

            spacing: 10

            TextField {
                id: filename
                text: "/home/user/MyDocs/sms_backup.csv"
                width: parent.width
                readOnly: !backupButton.enabled
            }

            Button {
                id: backupButton
                text: "Backup SMS"
                onClicked: {
                    statusLabel.text = 'Backing up...';
                    controller.backup(filename.text);
                    backupButton.enabled = false;
                }
                width: parent.width
            }

            Button {
                visible: false /* Not visible for now */
                text: "Restore SMS"
                onClicked: {
                    statusLabel.text = 'Restoring...';
                    controller.backup(filename.text);
                    backupButton.enabled = false;
                }
                enabled: backupButton.enabled
                width: parent.width
            }

            Row {
                width: parent.width
                spacing: 10

                Label {
                    text: 'Status:'
                    font.bold: true
                }

                Label {
                    id: statusLabel
                    text: 'Idle'
                }
            }

            Connections {
                target: controller
                onSuccess: {
                    statusLabel.text = 'Operation successful.';
                    backupButton.enabled = true;
                }
                onFailure: {
                    statusLabel.text = 'Something went wrong.';
                    backupButton.enabled = true;
                }
            }
        }
    }
}


