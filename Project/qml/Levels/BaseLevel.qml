import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    property string levelName
    property bool active: false
    property Player playerP
    property Scene scene;
    property BackgroundMusic backgroundMusic: backgroundMusic
    property Image bgimg: background;

    property int state_RUNNING: 0
    property int state_NOSPAWNING: 1
    property int state_VICTORY: 2
    property int state_DEFEAT: 3
    property int state_PAUSE: 9

    property int state: state_RUNNING
    property int totalSpawns
    property int currentSpawns: 0
    property int kills: 0



    BackgroundMusic {
        id: backgroundMusic
        autoPlay: false
    }


    Image {
        id: background
        anchors.fill: parent
        z: 0
    }



    ParallaxScrollingBackground {
        id: parallax1
          movementVelocity: Qt.point(0,35)
          ratio: Qt.point(1.0,1.0)
          opacity: 0.7
          z: 5
          sourceImage: "../../assets/Sectors/Sector3/parallax1.png"
          sourceImage2: "../../assets/Sectors/Sector3/parallax2.png"
        }

    ParallaxScrollingBackground {
        id: parallax2
          movementVelocity: Qt.point(0,10)
          ratio: Qt.point(1.0,1.0)
          opacity: 0.7
          z: 4
          sourceImage: "../../assets/Sectors/Sector3/parallaxstars.png"
        }



    Timer {
        id: victoryTimer
        interval: 3000; running: false; repeat: false;
        onTriggered: victory();
    }


    function checkVictory() {
        if(kills >= totalSpawns) {
            console.debug("Victory! Kills: " + kills + ", Total Spawns: " + totalSpawns);
            victoryTimer.start();
        }
    }

    function victory() {
        end();
        scene.endLevel();
    }

    function defeat() {
        end();
        scene.endLevel();
    }

    function end() {
        backgroundMusic.stop();
    }
}

