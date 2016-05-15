import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0


Scene {
    id: levelselectscene
    property GameWindow scenemaster

    width: 640
    height: 960

    property string chosenLevel: "Level1.qml"
    property int activeLevel: 1

    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible



    signal levelPressed(string selectedLevel)


    onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            scenemaster.gameScene.setLevel("");
            scenemaster.gameScene.setLevel(selectedLevel)
        }



    Image {
        anchors.fill: parent
        source: "../../assets/UI/Background.png"
        z: 0
        id: background
    }

    Image {
        x: 100
        y: 100
        z: 50
        scale: 1.3
        source: "../../assets/UI/sector1.png"
        id: sectorbg
    }


    /*
    Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Level Select Scene"
     }
     */



    Rectangle {
        height: 50
        width: 50
        color: "blue"

        x: gamescene.width - 50
        y: 50

        MouseArea {
               anchors.fill: parent
               onClicked: {
                   scenemaster.switchScene(1);
               }
           }
    }







    // LEVEL 1
    Item {
        x: 155
        y: 530
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (activeLevel == 1) ? "../../assets/UI/level_sel.png" : "../../assets/UI/level_done.png"
            id: level1img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Level 1"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   activeLevel = 1
                   chosenLevel = "Level1.qml"
                 }
           }
    }

    // LEVEL 2
    Item {
        x: 205
        y: 385
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (activeLevel == 2) ? "../../assets/UI/level_sel.png" : "../../assets/UI/level_done.png"
            id: level2img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Level 2"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   activeLevel = 2
                   chosenLevel = "Level2.qml"
                 }
           }
    }



    // LEVEL 3
    Item {
        x: 345
        y: 335
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (activeLevel == 3) ? "../../assets/UI/level_sel.png" : "../../assets/UI/level_done.png"
            id: level3img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Level 3"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   activeLevel = 3
                   chosenLevel = "Level3.qml"
                 }
           }
    }



    // LEVEL 4
    Item {
        x: 383
        y: 187
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (activeLevel == 4) ? "../../assets/UI/level_sel.png" : "../../assets/UI/level_done.png"
            id: level4img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Level 4"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {                   
                   activeLevel = 4
                   chosenLevel = "Level4.qml"
                 }
           }
    }


    // LEVEL 5
    Item {
        x: 312
        y: 80
        height: 60
        width: 200

        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (activeLevel == 5) ? "../../assets/UI/level_bosssel.png" : "../../assets/UI/level_bossdone.png"
            id: level5img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Level 5"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   activeLevel = 5
                   chosenLevel = "Level5.qml"
                 }
           }
    }





    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 350
        z: 50
        scale: 0.7
        source: "../../assets/UI/Launch.png"
        id: campaign



        MouseArea {
               anchors.fill: parent
               onClicked: {
                   levelPressed(chosenLevel)
                   scenemaster.switchScene(3);
                 }
           }
    }


    Xread{
        id:xread
    }
    Xwrite{
        id:xwrite
    }




}
