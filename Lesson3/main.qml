import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Lesson3")

    Column{
        anchors.fill: parent
        padding: 10
        spacing: 5
           Text{
                text: "Регистрация в приложении знакомств"
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.italic: true
                font.family: "Helvetica"
           }
           TextField{
               id: nameTF
               width: parent.width / 4
               height: 20
               anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: "Имя"
               placeholderTextColor: "light blue"
               font.italic: true
               font.family: "Helvetica"
               color: "black"
           }

           Rectangle{

               width: parent.width / 4
               anchors.horizontalCenter: parent.horizontalCenter
               Text{
                    text: "Пол"
               }
               ComboBox{
                   id: genderCB
                   editable: true
                   anchors.horizontalCenter: parent.horizontalCenter
                        model: ListModel {
                            id: model
                            ListElement { text: "Муж" }
                            ListElement { text: "Жен" }
                        }
                        onAccepted: {
                            if (find(editText) === -1)
                                model.append({text: editText})
                        }
               }
           }

           TextField{
               id: ageTF
               width: parent.width / 4
               height: 20
               anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: "Возраст"
               placeholderTextColor: "light blue"
               font.italic: true
               font.family: "Helvetica"
               color: "black"
           }
           TextField{
               id: educationTF
               width: parent.width / 4
               height: 20
               anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: "Образование"
               placeholderTextColor: "light blue"
               font.italic: true
               font.family: "Helvetica"
               color: "black"
           }
           TextField{
               id: hobbyTF
               width: parent.width / 4
               height: 20
               anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: "Интересы"
               placeholderTextColor: "light blue"
               font.italic: true
               font.family: "Helvetica"
               color: "black"
           }
           TextField{
               id: cityTF
               width: parent.width / 4
               height: 20
               anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: "Город"
               placeholderTextColor: "light blue"
               font.italic: true
               font.family: "Helvetica"
               color: "black"
           }
           Button{
               id: regBtn
               width: parent.width / 4
               height: 35
               anchors.horizontalCenter: parent.horizontalCenter
               text: "Регистрация"
               onClicked: print("Имя: " + nameTF.text +
                                "; Пол: " + genderCB.currentText +
                                "; Возраст: " + ageTF.text +
                                "; Образование: " + educationTF.text +
                                "; Интересы: " + hobbyTF.text +
                                "; Город: " + cityTF.text)
           }

    }
    Rectangle{
        id: rect2
        x: parent.width / 2 - 50
        y: 220
        width: 100
        height: 100
        color: "light green"
        border.color: "black"
        border.width: 5
        radius: 10
        RotationAnimator {
                id: animR
                target: rect2;
                from: 0;
                to: 360;
                duration: 1000
            }

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: //rect2.color = "red"
                           (mouse)=> {
                                       if (mouse.button == Qt.LeftButton)
                                            rect2.color = "red"
                                       if (mouse.button == Qt.RightButton)
                                           animR.start()
                                       }
                onDoubleClicked: rect2.radius = 100
            }
    }

}
