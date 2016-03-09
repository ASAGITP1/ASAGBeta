import VPlay 2.0
import QtQuick 2.0

Scene {
    id: editorscene
    property GameWindow scenemaster

    width: 640
    height: 960

    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible


    Rectangle{
        width: editorscene.width
        height:editorscene.height/6
        color:"red"

        x: 0
        y: 0
    }

    Rectangle{
        //back to menu
        width: 30
        height:30
        color:"blue"

        x: editorscene.width -40
        y: 20

        MouseArea {
               anchors.fill: parent
               onClicked: {
                    scenemaster.switchScene(1);
               }
           }
    }

    Rectangle {
        width: 50
        height: 50
        color: "grey"
         border.color:"black"

        x: 100
        y: 300
    }
    Rectangle {
        width: 50
        height: 50
        color: "grey"
         border.color:"black"

        x: 100
        y: 350
    }


}
