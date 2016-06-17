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
    property Image bgimg: background
    property DamageObject damageObject: damageObject

    property int state_RUNNING: 0
    property int state_NOSPAWNING: 1
    property int state_VICTORY: 2
    property int state_DEFEAT: 3
    property int state_PAUSE: 9

    property int state: state_RUNNING
    property int totalSpawns
    property int currentSpawns: 0
    property int kills: 0


    Component.onCompleted: {
        playerP.startAnim();
    }

    BackgroundMusic {
        id: backgroundMusic
        autoPlay: false
    }


    Image {
        id: background
        source: "../../../assets/UI/Background.png"
        anchors.fill: parent
        z: 0
    }

/*

*/

    Image {
        id: victoryimg
        source: "../../assets/UI/Victory.png"
        x: 70
        y: 600
        z: 500
        opacity: 0
    }


    Timer {
        id: victoryTimer
        interval: 3000; running: false; repeat: false;
        onTriggered: victory();
    }


    DamageObject {
        id: damageObject
        z: 400
        x: 800
        y: 1700
    }



    function checkVictory() {
        if(kills >= totalSpawns) {
            console.debug("Victory! Kills: " + kills + ", Total Spawns: " + totalSpawns);
            victoryTimer.start();
            victoryimg.opacity = 1;
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

