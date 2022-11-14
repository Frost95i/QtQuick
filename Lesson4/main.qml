import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.15

Item {
    anchors.fill: parent
    ChartView {
    title: "Диаграмма"
    anchors.fill: parent
    antialiasing: true


    ScatterSeries {
        id:scatter1
        name: "ScatterSeries"
        XYPoint { x: 7; y: 13 }
        XYPoint { x: 31; y: 10 }
        XYPoint { x: 61; y: 9 }
        XYPoint { x: 99; y: 10 }
        XYPoint { x: 129; y: 12 }
        XYPoint { x: 178; y: 20 }
        XYPoint { x: 209; y: 26 }
     }

    LineSeries {
        name: "LineSeries"
        XYPoint { x: 7; y: 13 }
        XYPoint { x: 31; y: 10 }
        XYPoint { x: 61; y: 9 }
        XYPoint { x: 99; y: 10 }
        XYPoint { x: 129; y: 12 }
        XYPoint { x: 178; y: 20 }
        XYPoint { x: 209; y: 26 }
    }
  }
}
