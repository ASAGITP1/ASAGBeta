import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Scene {
    id: gamescene
    property GameWindow scenemaster

    width: 640
    height: 960


    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible




    Keys.forwardTo: player.controller




    PhysicsWorld {
        debugDrawVisible: false // set this to false to hide the physics overlay
        updatesPerSecondForPhysics: 60
    }


    Timer {
           interval: 1000; running: true; repeat: true
           onTriggered: spawnEnemy()
       }

    function spawnEnemy() {
        var newEntityProperties = {
            x: Math.random() * 500 + 50,
            y: 100
        }

       entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy.qml"), newEntityProperties  )
    }


    EntityManager {
       id: entityManager
       entityContainer: gamescene
       poolingEnabled: false

       dynamicCreationEntityList: [
                Qt.resolvedUrl("../Player/Shot.qml"),
                Qt.resolvedUrl("../Enemy/Enemy.qml")
           ]
     }



    Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Game Scene"
     }


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



    Player {
        id: player
        sceneP: gamescene
        x: 200
        y: 500
    }

}
