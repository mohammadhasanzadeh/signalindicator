import QtQuick 2.15
import QtQuick.Controls 2.15

ProgressBar
{
    id: control
    value: 0.5
    padding: 2
    background: Item {}
    contentItem: BarIndicator {}

    property int indicatorCount: 4
    readonly property int turnOnIndicatorCount: (control.visualPosition * control.indicatorCount)
}