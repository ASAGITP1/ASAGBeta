import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0


Scene {
    id: levelselectscene1
    property GameWindow scenemaster

    width: 1080
    height: 1920

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
            scenemaster.gameScene.activeSector = "Sector1";
            scenemaster.gameScene.setLevel(selectedLevel)
        }



    ParallaxScrollingBackground {
        anchors.fill: parent
        movementVelocity: Qt.point(20,0);
        ratio: Qt.point(1.0, 1.0)
        sourceImage: "../../assets/UI/new/bsbackground.png"
        z: 0
        id: scrollbackground
    }

    /*Image {
        x: 100
        y: 100
        z: 50
        scale: 1.3
        source: "../../assets/UI/sector1.png"
        id: sectorbg
    }*/


    /*
    Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Level Select Scene"
     }
     */

    // Backbutton
    Image {
        source: "../../assets/UI/new/backbutton.png"

        anchors.left: parent.left
        y: 50
        x: 50
        height: 80
        width: 150

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            font.pixelSize: 50
            color: "#FFFFFF"
            text: "Back"
            id: backbtntext
        }

        MouseArea {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: backbtntext.right
            anchors.bottom: parent.bottom

            onClicked: {
               scenemaster.switchScene(2);
            }
        }
    }

    property int rotator:
    rotator=0;
    Timer {
           interval: 50; running: true; repeat: true
           onTriggered: rotator=(rotator-10)%360
       }



    // LEVEL 1
    Item {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -150
        y: parent.height * 4.5 / 7
        height: 75
        width: 75


        Image {
            x: 0
            y: 0
            z: 50
            width: 75
            height: 75
            source: (activeLevel == 1) ? "../../assets/UI/LVL/s2lvl.png" : "../../assets/UI/LVL/s2lvl.png"
            id: level1img
        }

        Image{
            x:level1img.x
            y:level1img.y
            width:level1img.width
            height:level1img.height
            scale:1.8
            source: "../../assets/UI/selectgraphic.png"
            visible: (activeLevel == 1) ? true : false
            transform: Rotation{
                origin {
                      x: level1img.width / 2
                      y: level1img.height / 2
                    }angle:rotator
            }

        }

        Text {
            anchors.verticalCenter: level1img.verticalCenter
            anchors.left: level1img.right
            anchors.leftMargin: 50
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
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 3.75 / 7
        height: 75
        width: 75


        Image {
            x: 0
            y: 0
            z: 50
            width: 75
            height: 75
            source: (activeLevel == 2) ? "../../assets/UI/LVL/s2lvl.png" : "../../assets/UI/LVL/s2lvl.png"
            id: level2img
        }

        Image{
            x:level2img.x
            y:level2img.y
            width:level2img.width
            height:level2img.height
            scale:1.8
            source: "../../assets/UI/selectgraphic.png"
            visible: (activeLevel == 2) ? true : false
            transform: Rotation{
                origin {
                      x: level2img.width / 2
                      y: level2img.height / 2
                    }angle:rotator
            }

        }

        Text {
            anchors.verticalCenter: level2img.verticalCenter
            anchors.left: level2img.right
            anchors.leftMargin: 50
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 150
        y: parent.height * 3 / 7
        height: 75
        width: 75


        Image {
            x: 0
            y: 0
            z: 50
            width: 75
            height: 75
            source: (activeLevel == 3) ? "../../assets/UI/LVL/s2lvl.png" : "../../assets/UI/LVL/s2lvl.png"
            id: level3img
        }
        Image{
            x:level3img.x
            y:level3img.y
            width:level3img.width
            height:level3img.height
            scale:1.8
            source: "../../assets/UI/selectgraphic.png"
            visible: (activeLevel == 3) ? true : false
            transform: Rotation{
                origin {
                      x: level3img.width / 2
                      y: level3img.height / 2
                    }angle:rotator
            }

        }

        Text {
            anchors.verticalCenter: level3img.verticalCenter
            anchors.left: level3img.right
            anchors.leftMargin: 50
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
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 2.25 / 7
        height: 75
        width: 75


        Image {
            x: 0
            y: 0
            z: 50
            width: 75
            height: 75
            source: (activeLevel == 4) ? "../../assets/UI/LVL/s2lvl.png" : "../../assets/UI/LVL/s2lvl.png"
            id: level4img
        }
        Image{
            x:level4img.x
            y:level4img.y
            width:level4img.width
            height:level4img.height
            scale:1.8
            source: "../../assets/UI/selectgraphic.png"
            visible: (activeLevel == 4) ? true : false
            transform: Rotation{
                origin {
                      x: level4img.width / 2
                      y: level4img.height / 2
                    }angle:rotator
            }

        }

        Text {
            anchors.verticalCenter: level4img.verticalCenter
            anchors.left: level4img.right
            anchors.leftMargin: 50
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -150
        y: parent.height * 1.5 / 7
        height: 100
        width: 100

        Image {
            x: 0
            y: 0
            z: 50
            width: 100
            height: 100
            source: (activeLevel == 5) ? "../../assets/UI/level_bosssel.png" : "../../assets/UI/level_bosssel.png"
            id: level5img
        }
        Image{
            x:level5img.x
            y:level5img.y
            width:level5img.width
            height:level5img.height
            scale:1.8
            source: "../../assets/UI/selectgraphic.png"
            visible: (activeLevel == 5) ? true : false
            transform: Rotation{
                origin {
                      x: level5img.width / 2
                      y: level5img.height / 2
                    }angle:rotator
            }

        }

        Text {
            anchors.verticalCenter: level5img.verticalCenter
            anchors.left: level5img.right
            anchors.leftMargin: 50
            z: 50
            font.pixelSize: 30
            color: "#DDDDDD"
            text: "Boss Level"
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
        y: parent.height - 250
        z: 50
        height: 100
        width:100
        source: "../../assets/UI/new/play_icon.png"
        id: campaign



        MouseArea {
               anchors.fill: parent
               onClicked: {
                   levelPressed(chosenLevel)
                   scenemaster.switchScene(8);
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
