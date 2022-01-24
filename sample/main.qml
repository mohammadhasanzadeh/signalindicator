import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.12
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import QtQuick.Layouts 1.15

import com.melije.SignalIndicator 1.0

ApplicationWindow
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

//    Material.theme: Material.Dark
    Universal.theme: Universal.Dark

    SignalIndicator
    {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 30
        anchors.leftMargin: 80
        value: slider.value
        from: slider.from
        to: slider.to
        width: 50
        height: 100
    }

    RowLayout
    {
        id: row
        anchors.centerIn: parent
        width: parent.width * 0.7
        spacing: 25
        height: 50

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: ArcIndicator {
                turnOnColor: Material.color(Material.Blue)
                turnOffColor: Material.color(Material.LightBlue, Material.Shade100)
            }
        }

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: BarIndicator {
                radius: 5
                turnOnColor: Material.color(Material.Green)
            }
        }

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            indicatorCount: 6
            contentItem: ArcIndicator {
                turnOnColor: "purple"
                capStyle: ShapePath.RoundCap
                animation: false
            }
        }

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: BarIndicator {
                animation: false
                spacing: 5
                headCut: true
            }
        }

        SignalIndicator
        {
            value: slider.value
            from: slider.from
            to: slider.to
            Layout.preferredWidth: 50
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.fillHeight: true
            indicatorCount: 4
            contentItem: ArcIndicator {
                turnOnColor: "lightblue"
            }
        }
    }

    Slider
    {
        id: slider
        anchors.top: row.bottom
        anchors.horizontalCenter: row.horizontalCenter
        from: 0
        to: 100
        value: 0
    }

    Label
    {
        text: slider.value
        anchors.left: slider.right
        anchors.verticalCenter: slider.verticalCenter
    }
}
