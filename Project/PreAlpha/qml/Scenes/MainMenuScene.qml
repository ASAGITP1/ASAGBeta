import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0


import "../vars.js" as Global

Scene {
    id: mainmenuscene
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

    onLevelPressed: {
        // selectedLevel is the parameter of the levelPressed signal
        scenemaster.gameScene.setLevel("");
        scenemaster.gameScene.setLevel(selectedLevel)
    }

    // Background
    /*
    Image {
        anchors.fill: parent
        source: "../../assets/UI/new/bsbackground.png"
        z: -1
        id: background
    }*/

    ParallaxScrollingBackground {
        anchors.fill: parent
        movementVelocity: Qt.point(20,0);
        ratio: Qt.point(1.0, 1.0)
        sourceImage: "../../assets/UI/new/bsbackground.png"
        z: 0
        id: scrollbackground
    }


    // ################# DEBUG #########################
    /*Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Main Menu Scene"
     }*/
    // #################################################


    // Soundbutton
    Image {
        x: parent.width-100
        y: 50
        z: 50
        scale: 1
        source: "../../assets/UI/new/sound_icon.png"
        height:75
        width:75
        id: mutebutton

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(Global.mute==0) {
                    mutebutton.source="../../assets/UI/new/mute_icon.png";
                    Global.mute=1;
                } else {
                    mutebutton.source="../../assets/UI/new/sound_icon.png";
                    Global.mute=0;
                }
            }
        }
    }

    // Animation des Playbuttons
    property int myangle: angle = 0;
    property int movem: movem = 0;

    Timer {
        interval: 25
        running: true
        repeat: true
        onTriggered: {
            myangle = (myangle - 3) % 360
            movem = Math.sin(2 * Math.PI * myangle / 360) * 10
        }
    }

    // Playbutton
    Image {
        anchors.centerIn: parent
        z: 50
        scale: 1
        source: "../../assets/UI/new/play_planet.png"
        height: 400
        width: 400
        id: campaign

        transform: Translate {
            y: movem;
        }

        Text {
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 80
            color: "#FFFFFF"
            text: "Play"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                scenemaster.switchScene(2);
            }
        }
    }

    // Editorbutton
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 500
        z: 50
        scale: 1
        source: "../../assets/UI/new/editornew.png"
        height: 300
        width: 300
        id: editor

        Text {
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
            color: "#FFFFFF"
            text: "Customize Ship"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                editorscene.shipid=xread.readXML("ship")
                console.debug("ship id:",editorscene.shipid)

                if(editorscene.shipid==0){
                    xwrite.writeXML(1)
                }

                editorscene.initialize();
                editorscene.createswag();
                scenemaster.switchScene(9);
            }
        }
    }

    // Shopbutton
    /*
    Image {
        //anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 300
        x: parent.width/8
        z: 50
        scale: 1
        source: "../../assets/UI/new/shop_planet.png"
        height: 200
        width: 200
        id: shop
    }*/


    /* NOT IMPLEMENTED YET
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 600
        z: 50
        scale: 0.7
        source: "../../assets/UI/RealmOfTrials.png"
        id: realmoftrials



        MouseArea {
               anchors.fill: parent
               onClicked: {
                 }
           }
    }
    */

    Xread{
        id:xread
    }

    Xwrite{
        id:xwrite
    }
}
