import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Triangle 1.0

Window {
    id: primaryFrame
    width: 640
    height: 480
    visible: true
    title: qsTr("Login form")
    color: "#e5ecef"

    property string login: "login"
    property string password: "password"
    // Javascript-функция для проверки данных
    function checkCredentials() {
        if (login === loginTextField.text  && password === passwordTextField.text){
               console.log("Успешный вход")
            successAnimation.start();
        }
        else
            console.log("Неудачный вход")
             failAnimation.start()
    }


    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent // Размещение компонента внутри родительского
        radius: 5 // Закругление углов с выбранным радиусом
        width: 300
        height: 250
        property string textColor: "#535353" // Вынесение общих данных для дочерних элементов в переменную
        Column { // аналог QVBoxLayout
            anchors.fill: parent // объект занимает все пространство родителя
            padding: 32 // отступы по 4 сторонам от родительского элемента
            spacing: 32 // отступы между элементами
            TextField {
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
                placeholderText: qsTr("Логин")
                color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()

            }
            TextField {
                id: passwordTextField
                echoMode: TextInput.Password // звездочки вместо пароля
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Пароль")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()

            }
            Button {
                id: submitButton
                width: 200
                height: 40
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                } // разный цвет кнопки при нажатии, наведении курсора и в обычном состоянии
                text: qsTr("Вход")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: checkCredentials()
            }
            Button {
                id: newScreenBtn
                width: 200
                height: 40
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                } // разный цвет кнопки при нажатии, наведении курсора и в обычном состоянии
                text: qsTr("Рассчет треуголника")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: zdialog.open()
            }
        }
    }
    Dialog{
    id: zdialog
    width: parent.width
    height: parent.height
    title: "Площадь треугольника"

    Triangle{
        id: triangle

    }

    Column { // аналог QVBoxLayout
        anchors.fill: parent // объект занимает все пространство родителя
        padding: 32 // отступы по 4 сторонам от родительского элемента
        spacing: 32 // отступы между элементами

        TextField {
            id: aTextField
            anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
            placeholderText: qsTr("a")
            color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)

        }
        TextField {
            id: bTextField
            anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
            placeholderText: qsTr("b")
            color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)
        }
        TextField {
            id: cTextField
            anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
            placeholderText: qsTr("c")
            color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)
        }
        TextField {
            id: resTextField
            anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
            placeholderText: qsTr("Result")
            color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)

        }
        Button{
            id: resultBtn
            text: "Рассчет"
            anchors.horizontalCenter: parent.horizontalPadding

        }
        Button{
            id: closeBtn
            text: "Выход"
            anchors.horizontalCenter: parent.horizontalPadding
            onClicked: resultField.text()
            }
        Text{
            text: "Result: " + triangle.resValueChanged(1, 2, 3)
        }
    }
    }
    ParallelAnimation{
        id: failAnimation
        SequentialAnimation {
            // Группа анимаций внутри SequentialAnimation будет выполнена   последовательно
            PropertyAnimation {
                // Текст внутри полей логина и пароля моментально изменит цвет на темно-красный
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: "dark red"
                duration: 0
            }
            PropertyAnimation {
                // После этого за 400 миллисекунд вернется к обычному цвету
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: secondaryFrame.textColor
                duration: 400
            }
        }
        SequentialAnimation {
            NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: -5; duration: 50 }
            NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: 5; duration: 100 }
            NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: 0; duration: 50 }
        }
    }
    SequentialAnimation{
        id: successAnimation
        PropertyAnimation {
            targets: [loginTextField, passwordTextField, submitButton]
            property: "opacity"
            to: 0
            duration: 400
        }
        PropertyAnimation {
            target: secondaryFrame
            property: "opacity"
            to: 0
            duration: 600
        }
    }

}

