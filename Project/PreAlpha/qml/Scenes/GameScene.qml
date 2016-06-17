import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"
import "../Levels"

Scene {
    id: gamescene
    property GameWindow scenemaster

    property Player player


    width: 1080
    height: 1920


    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible




    Keys.forwardTo: player.controller


    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    property string activeSector
    // the currently loaded level gets stored here
    property variant activeLevelE

    function setLevel(fileName) {
       activeLevelFileName = fileName
     }

    Loader {
       id: loader
       property BaseLevel activeLevel
       width: gamescene.width
       height: gamescene.height
       z: 10
       source: activeLevelFileName !== "" ? "../Levels/" + activeSector + "/" + activeLevelFileName : ""
       onLoaded: {
            activeLevel = loader.children[0];
            activeLevelE = loader.children[0];
            activeLevel.active = true;
            activeLevel.scene = gameScene;
            player = activeLevel.playerP;
       }
     }





    PhysicsWorld {
        debugDrawVisible: false // set this to false to hide the physics overlay
        updatesPerSecondForPhysics: 60
    }


    Rectangle {
        id: leftwall
        x: 0
        y: -100
        z:70
        height: parent.height + 200
        width: 5
        color: "red"
        opacity: 0

        BoxCollider {
            bodyType: Body.Static
            height: parent.height
            width: parent.width
            categories: Box.Category9
            collidesWith: Box.Category9
        }
    }


    Rectangle {
        id: rightwall
        x: parent.width
        y: -100
        z:70
        height: parent.height + 200
        width: 5
        color: "red"
        opacity: 0

        BoxCollider {
            bodyType: Body.Static
            height: parent.height
            width: parent.width
            categories: Box.Category9
            collidesWith: Box.Category9
        }
    }




    EntityManager {
       id: entityManager
       entityContainer: gamescene
       poolingEnabled: false

       dynamicCreationEntityList: [
               Qt.resolvedUrl("../Player/Shot.qml"),
               Qt.resolvedUrl("../Enemy/Sector1/Enemy1.qml"),
               Qt.resolvedUrl("../Enemy/Sector1/Enemy2.qml"),
               Qt.resolvedUrl("../Enemy/Sector1/Shot1.qml"),
               Qt.resolvedUrl("../Enemy/Sector2/Enemy1.qml"),
               Qt.resolvedUrl("../Enemy/Sector2/Enemy2.qml"),
               Qt.resolvedUrl("../Enemy/Sector2/Shot1.qml"),
               Qt.resolvedUrl("../Enemy/Sector3/Enemy1.qml"),
               Qt.resolvedUrl("../Enemy/Sector3/Enemy2.qml"),
               Qt.resolvedUrl("../Enemy/Sector3/Shot1.qml"),
               Qt.resolvedUrl("../Enemy/Sector4/Enemy1.qml"),
               Qt.resolvedUrl("../Enemy/Sector4/Enemy2.qml"),
               Qt.resolvedUrl("../Enemy/Sector4/Shot1.qml")
           ]
     }





    Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Game Scene" + activeSector + activeLevelFileName
     }



    // Backbutton
    Image {
        source: "../../assets/UI/new/backbutton.png"

        anchors.left: parent.left
        y: 50
        x: 50
        z: 99
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
               endLevel();
            }
        }
    }




    function endLevel() {
        activeLevelE.end();
        loader.activeLevel.active = false;
        var toRemoveEntityTypes = ["enemy", "shot"];
        entityManager.removeEntitiesByFilter(toRemoveEntityTypes);

        var sector = 1;

        if(activeSector == "Sector1") sector = 1;
        else if(activeSector == "Sector2") sector = 2;
        else if(activeSector == "Sector3") sector = 3;
        else if(activeSector == "Sector4") sector = 4;

        scenemaster.switchScene(2 + sector);
    }

}
