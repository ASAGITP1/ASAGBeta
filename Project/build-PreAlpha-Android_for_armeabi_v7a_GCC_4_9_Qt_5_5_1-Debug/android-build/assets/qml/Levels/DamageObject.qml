import QtQuick 2.0
import VPlay 2.0
import xread 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    id: damageObject
    width: 150
    height: 150
    property int swidth: width / 3;     // slot width for positioning
    property int sheight: height / 3;


    property variant srces: ["", "cannon1", "cannon2"]
    property variant modules: [module1, module2, module3, module4, module5, module6, module7]
    property variant images: [img1, img2, img3, img4, img5, img6, img7]

    Xread{
        id:xread
    }

    function heDed(module) {
        console.log("DED: " + module);
        modules[module-1].broken = true;
        images[module-1].update();
    }

    Component.onCompleted: {

        module1.module = xread.readXML("slot", 1);
        img1.update();
        module2.module = xread.readXML("slot", 2);
        img2.update();
        module3.module = xread.readXML("slot", 3);
        img3.update();
        module4.module = xread.readXML("slot", 4);
        img4.update();
        module5.module = xread.readXML("slot", 5);
        img5.update();
        module6.module = xread.readXML("slot", 6);
        img6.update();
        module7.module = xread.readXML("slot", 7);
        img7.update();
    }

    Rectangle {
        id: module1
        x: swidth * 1;
        y: sheight * 0;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img1
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module2
        x: swidth * 0;
        y: sheight * 1;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img2
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module3
        x: swidth * 1;
        y: sheight * 1;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img3
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module4
        x: swidth * 2;
        y: sheight * 1;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img4
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module5
        x: swidth * 0;
        y: sheight * 2;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img5
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module6
        x: swidth * 1;
        y: sheight * 2;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img6
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }



    Rectangle {
        id: module7
        x: swidth * 2;
        y: sheight * 2;
        width: swidth;
        height: sheight;
        property bool broken: false;
        property int module: 0
        color: "#44FFFFFF"
        border.color: "#CCCCCC"

        Image {
            id: img7
            height: parent.height
            width: parent.width
            z: 400;
            source:(parent.broken) ? "../../../assets/Player/" + srces[parent.module] + "_broken.png" : "../../../assets/Player/" + srces[parent.module] + ".png"
        }
    }

}

