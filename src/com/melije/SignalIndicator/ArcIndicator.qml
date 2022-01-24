import QtQuick 2.15
import QtQuick.Shapes 1.12

Item
{
    id: control

    property color turnOnColor: "red"
    property color turnOffColor: "lightgray"
    property bool animation: true
    property int animationDuration: 500
    property int capStyle: ShapePath.FlatCap
    property int indicatorWidth: 5

    Repeater
    {
        id: repeater
        model: control.parent.indicatorCount
        property real raduis_spacing: control.width / control.parent.indicatorCount

        delegate: Shape {
            id: shape
            width: control.width
            height: control.height
            antialiasing: true
            ShapePath
            {
                strokeWidth: control.indicatorWidth
                strokeColor: (control.parent.turnOnIndicatorCount > index) ? control.turnOnColor : control.turnOffColor
                fillColor: "transparent"
                capStyle: control.capStyle
                PathAngleArc
                {
                    centerX: 0
                    centerY: shape.height
                    radiusX: repeater.raduis_spacing * (index + 1)
                    radiusY: radiusX
                    startAngle: 0
                    sweepAngle: -90
                    moveToStart: true
                }

                Behavior on strokeColor {
                    enabled: control.animation
                    ColorAnimation
                    {
                        duration: control.animationDuration
                    }
                }
            }
        }
    }
}
