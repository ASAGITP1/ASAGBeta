import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

EntityBase {
    id: playerr

    property Scene sceneP: scene
    property alias controller: twoAxisController

    Rectangle {
        anchors.fill: parent
        color: "#AAAAAA"
        z: 0
        id: background
    }



    TwoAxisController { //for testing on the keyboard
        id: twoAxisController
    }

    Accelerometer { //for android movement
        id: accelerometer
        active: true

      }


    BoxCollider {
        id: collider
        bodyType: Body.Dynamic
        categories: Box.Category1

        property int speed: system.desktopPlatform ? // controls (
        twoAxisController.xAxis * 200 :  //  for desktop
        (accelerometer.reading !== null ? -accelerometer.reading.x * 200 : 0)   // for mobile

        linearVelocity: Qt.point(speed, 0)
    }

    ModuleHolder {
        x: 0
        y: 0
        dynamicModule: moduleList.chaingun
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 0
        dynamicModule: moduleList.chaingun
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 100
        dynamicModule: moduleList.lasergun
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 100
        dynamicModule: moduleList.lasergun
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 200
        dynamicModule: moduleList.cmodule1
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 200
        dynamicModule: moduleList.cmodule1
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 300
        dynamicModule: moduleList.cmodule1
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 300
        dynamicModule: moduleList.cmodule1
        player: playerr
    }



}

