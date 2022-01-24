import QtQuick 2.15
import QtQuick.Shapes 1.12

import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15

Item
{
    id: control
    property color turnOnColor: "red"
    property color turnOffColor: "lightgray"
    property real radius: 0
    property bool animation: true
    property int animationDuration: 500
    property alias spacing: row.spacing
    property alias headCut: cut_loader.active

    Row
    {
        id: row
        anchors.fill: parent
        spacing: 1

        Repeater
        {
            id: repeater
            model: control.parent.indicatorCount
            property real bar_width: (control.width - (control.parent.indicatorCount * control.spacing)) / control.parent.indicatorCount
            property real bar_height: (control.height / control.parent.indicatorCount)
            delegate: Rectangle {
                radius: control.radius
                anchors.bottom: row.bottom
                width: repeater.bar_width
                height: repeater.bar_height * (index + 1)
                color: (control.parent.turnOnIndicatorCount > index) ? control.turnOnColor : control.turnOffColor
                Behavior on color {
                    enabled: control.animation
                    ColorAnimation {
                        duration: control.animationDuration
                    }
                }
            }
        }
    }

    Loader
    {
        id: cut_loader
        active: false
        anchors.fill: parent
        asynchronous: true
        sourceComponent: Control {
            id: cut_control
            background: Shape {
                id: cut_shape
                antialiasing: true
                ShapePath
                {
                    startX: 0
                    startY: 0
                    strokeWidth: -1
                    //                fillColor: control.Material.background ?? control.Universal.background
                    fillColor: Universal.background
//                    fillColor: cut_control.palette.midlight
                    //                fillColor: control.parent.palette.background
                    PathLine { x: 0; y: cut_shape.height }
                    PathLine { x: cut_shape.width; y: 0 }
                }
            }
        }
    }
}
