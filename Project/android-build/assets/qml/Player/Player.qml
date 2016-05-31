import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5
import xread 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

EntityBase {
    id: playerr
    entityType: "playership"
    width: 150
    height: 150

    property Scene sceneP: scene
    property alias controller: twoAxisController


    property var engines: new Array
    property int enginesI: 0

    property double forwardSpeed: 100
    property double forwardSpeedBase: 100
    property double forwardBoost: 1

    property double sidewaySpeed: 400
    property double sidewaySpeedBase: 400
    property double sidewayBoost: 1



    Component.onCompleted: initialize()


    Xread{
            id:xread
    }


    Image {
        anchors.fill: parent
        source: "../../assets/Player/ship1.png"
        z: 40
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
        width: parent.width
        height: parent.height
        bodyType: Body.Dynamic
        categories: Box.Category9
        sensor: false

        property int speed: system.desktopPlatform ? // controls (
        twoAxisController.xAxis * sidewaySpeed:  //  for desktop
        (accelerometer.reading !== null ? -accelerometer.reading.x * sidewaySpeed : 0)   // for mobile

        linearVelocity: Qt.point(speed, 0)
    }

    ModuleHolder {
        id: module1
        x: 50
        y: 0
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 1)]
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 50
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 2)]
        player: playerr
    }

    ModuleHolder {
        x: 50
        y: 50
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 3)]
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 50
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 4)]
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 100
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 5)]
        player: playerr
    }

    ModuleHolder {
        x: 50
        y: 100
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 6)]
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 100
        z: 50
        opacity: 0.5
        dynamicModule: moduleList.modules[xread.readXML("slot", 7)]
        player: playerr
    }




    function initialize() {
        calcSpeed();
    }

    function calcSpeed() {
        forwardBoost = 1;
        for(var i = 0; i < enginesI; i++) {
            forwardBoost += engines[i].boost;
        }
        forwardSpeed = forwardSpeedBase * forwardBoost;

        sidewayBoost = 1;
        for(i = 0; i < enginesI; i++) {
            sidewayBoost += engines[i].thrust;
        }
        sidewaySpeed = sidewaySpeedBase * sidewayBoost;
    }



}

