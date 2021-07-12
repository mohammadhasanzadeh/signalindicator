import QtQuick 2.15

Row
{
    id: control
    spacing: 1

    property color turnOnColor: "red"
    property color turnOffColor: "lightgray"
    property real radius: 0
    property bool animation: true
    property int animationDuration: 500

    Repeater
    {
        id: repeater
        model: control.parent.indicatorCount
        delegate: Rectangle {
            radius: control.radius
            anchors.bottom: control.bottom
            width: 10
            height: 10 * (index + 1)
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
