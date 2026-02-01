import QtQuick
import QtQuick.Effects
import Quickshell
import qs.Common
import qs.Services
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
    id: root

    property bool isOnline: pluginData.isOnline !== undefined ? pluginData.isOnline : true
    property string controlScript: "/home/oki/.openclaw/v-toggle.sh"

    horizontalBarPill: Component {
        Item {
            width: 16
            height: 24
            anchors.verticalCenter: parent.verticalCenter
            
            Rectangle {
                id: dot
                width: 8
                height: 8
                radius: 4
                color: "#ffffff"
                anchors.centerIn: parent
                opacity: root.isOnline ? 1.0 : 0.3
                
                layer.enabled: root.isOnline
                layer.effect: MultiEffect {
                    shadowEnabled: true
                    shadowColor: "#ffffff"
                    shadowBlur: 1.0
                    shadowHorizontalOffset: 0
                    shadowVerticalOffset: 0
                    opacity: 1.0
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: root.toggleSystem()
            }
        }
    }

    verticalBarPill: Component {
        Item {
            width: 24
            height: 16
            
            Rectangle {
                width: 8
                height: 8
                radius: 4
                color: "#ffffff"
                anchors.centerIn: parent
                opacity: root.isOnline ? 1.0 : 0.3
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: root.toggleSystem()
            }
        }
    }

    function toggleSystem() {
        let newState = !root.isOnline
        if (pluginService) pluginService.savePluginData(pluginId, "isOnline", newState)
        
        let statusArg = newState ? "ON" : "OFF"
        
        // Use standard execDetached for reliability
        Quickshell.execDetached(["bash", root.controlScript, statusArg])
        
        // Toast
        ToastService.showInfo("V Manager", "System " + statusArg)
    }
}
