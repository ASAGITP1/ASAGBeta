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
                        Global.activeid=gunid

                    }

                }
            }
    }

}
