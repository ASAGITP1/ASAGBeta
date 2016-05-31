import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0


Scene {
    id: sectorselectscene
    property GameWindow scenemaster

    width: 1080
    height: 1920

    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible



    signal levelPressed(string selectedLevel)

    property int selectedSector: 1;


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
            source: (selectedSector == 1) ? "../../assets/UI/SectorSelector/Sector3.png" : "../../assets/UI/SectorSelector/Sector3.png"
            id: level1img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Sector 1"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   selectedSector = 1;
                 }
           }
    }

    // LEVEL 2
    Item {
        x: 155
        y: 730
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (selectedSector == 1) ? "../../assets/UI/SectorSelector/Sector3.png" : "../../assets/UI/SectorSelector/Sector3.png"
            id: level2img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Sector 2"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   selectedSector = 2
                 }
           }
    }


    // LEVEL 3
    Item {
        x: 155
        y: 930
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (selectedSector == 1) ? "../../assets/UI/SectorSelector/Sector3.png" : "../../assets/UI/SectorSelector/Sector3.png"
            id: level3img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Sector 3"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   selectedSector = 3;
                 }
           }
    }


    // LEVEL 4
    Item {
        x: 155
        y: 1130
        height: 60
        width: 200


        Image {
            x: 0
            y: 0
            z: 50
            width: 50
            height: 50
            source: (selectedSector == 1) ? "../../assets/UI/SectorSelector/Sector4.png" : "../../assets/UI/SectorSelector/Sector4.png"
            id: level4img
        }

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           x: 50
           y: 10
           z: 50
           font.pixelSize: 30
           color: "#DDDDDD"
           text: "Sector 4"
         }


        MouseArea {
               anchors.fill: parent
               onClicked: {
                   selectedSector = 4;
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
                   scenemaster.switchScene(2 + selectedSector);
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
