import QtQuick 2.0
import VPlay 2.0
import xwrite 1.0
import xread 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

import "../vars.js" as Global

EntityBase {
    id:playerslot
    entityType: "Slot"

        property string slotid

        property int slotmeasure:100


        property Component load:id1
        property Component id0:id0
        property Component id1:id1
        property Component id2:id2

        x:0
        y:0


        Rectangle {
            height:slotmeasure
            width:slotmeasure
            color:Qt.rgba(0, 0, 0, 0.3)
            border.color: "black"

            MouseArea{
                anchors.fill:parent
                onClicked:{
                    slotid=Global.activeid
                    swap(slotid)
                }
            }
        }

        Component{
            id:id0
            Rectangle {
                height:slotmeasure
                width:slotmeasure
                color:Qt.rgba(0, 0, 0, 0.3)
                border.color: "black"


            }
        }

        Component{
            id:id1
        Image{
            height:slotmeasure
            width:slotmeasure
            source:"../../assets/Player/cannon1.png"
        }
        }

        Component{
            id:id2
        Image{
            id:id1
            height:slotmeasure
            width:slotmeasure
            source:"../../assets/Player/cannon2.png"
        }
        }

        Loader{
            id:loader
            sourceComponent:load
        }


        function swap(slotid){
            switch(slotid){
                case "0":
                    load=id0
                    slotid=0
                break;
                case "1":
                    load=id1
                    slotid=1
                break;
                case "2":
                    load=id2
                    slotid=2
                break;
                default:
                    load=id0
                    slotid=0
                break;
            }

        }

}

