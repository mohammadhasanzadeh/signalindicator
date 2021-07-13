import QtQuick 2.15
import QtQuick.Controls 2.15

ProgressBar
{
    id: control
    background: Item {}
    contentItem: BarIndicator {}
    implicitWidth: 30
    implicitHeight: 40

    property int indicatorCount: 4
    readonly property int turnOnIndicatorCount: (control.visualPosition * control.indicatorCount)
}
