import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Shipdesigns"
import "../vars.js" as Global


Item {
    id:cannonmodule
    property url picsource;
    property int x_spot;
    property int gunid;
    property int fadevalue;



    Rectangle{
        //first cannon
        id:cannon1
        width:100
        height:100
        x: x_spot
        y: 50
        color:Qt.rgba(0,0,0,0.3)
        border.color:"grey"
        border.width: 4
            Image{
                width:100
                height:100
                source:picsource

                MouseArea{
                    anchors.fill:parent
                    onClicked:{
                        Global.activeid=gunid;



                    }

                }
            }
    }

    Timer {
           id:fadeaway
           interval: 100; running: true; repeat: true
           onTriggered: fade();
    }

    function fade(){
        if(Global.activeid==gunid){
            cannon1.border.color=Qt.rgba(255,255,0,1)

        }
        else{
            cannon1.border.color="grey"

        }
    }

}




