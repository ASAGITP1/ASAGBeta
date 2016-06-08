import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Shipdesigns"
import "../Editor"
import "../vars.js" as Global


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

    property int shipid : xread.readXML("ship")

    Component.onCompleted: {console.debug("SWAGYOLOFUCKQ§IROVN")}

    EntityManager {
       id: entityManager
       entityContainer: editorscene
       poolingEnabled: false


     }

    Image {
        anchors.fill: parent
        source: "../../assets/UI/Background.png"
        z: 0
        id: background
    }

    Rectangle{

        id:toprec
        //upper part of the window
        width: editorscene.width + Global.module.count * 50 + 150
        height:editorscene.height/6
        color:Qt.rgba(0,0,0,0.3)


        x: 0
        y: 0

        MouseArea{
                anchors.fill: parent
                drag.target: toprec
                drag.axis: Drag.XAxis
                drag.minimumX: -Global.module.count * 100
                drag.maximumX: 0
        }


    }

    /* Manually inserted Modules
    EditorModule{

        id:cannon1
        x_spot:toprec.x+50
        picsource: Global.module1
        gunid:1
    }

    EditorModule{

        id:cannon2
        x_spot: toprec.x+250
        picsource: Global.module2
        gunid:2
    }
    */






    Image{
        //used as a background for the modules
        width:editorscene.width
        height:editorscene.width
        source:"../../assets/Player/ship1.png"
        x:-30
        y:200


    }







    EditorModule{
        id:deletemodule
        x_spot:450;
        picsource: ""
        gunid:0
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
                   save();
                    scenemaster.switchScene(1);
               }
           }
    }






    Slot{

        id:slot1
        x:250
        y:450

    }

    Slot{
        id:slot2
        x:150
        y:550

    }
    Slot{
        id:slot3
        x:250
        y:550

    }
    Slot{
        id:slot4
        x:350
        y:550

    }
    Slot{
        id:slot5
        x:150
        y:650

    }
    Slot{
        id:slot6
        x:250
        y:650

    }
    Slot{
        id:slot7
        x:350
        y:650

    }

    function initialize(){


        Global.globalshipid=shipid
        Global.id01=xread.readXML("slot",1)
        Global.id02=xread.readXML("slot",2)
        Global.id03=xread.readXML("slot",3)
        Global.id04=xread.readXML("slot",4)
        Global.id05=xread.readXML("slot",5)
        Global.id06=xread.readXML("slot",6)
        Global.id07=xread.readXML("slot",7)
        /*Global.id08=xread.readXML("slot",8)
        Global.id09=xread.readXML("slot",9)
        Global.id10=xread.readXML("slot",10)
        Global.id11=xread.readXML("slot",11)
        Global.id12=xread.readXML("slot",12)
        Global.id13=xread.readXML("slot",13)
        Global.id14=xread.readXML("slot",14)
        Global.id15=xread.readXML("slot",15)
        Global.id16=xread.readXML("slot",16)
        Global.id17=xread.readXML("slot",17)
        Global.id18=xread.readXML("slot",18)
        Global.id19=xread.readXML("slot",19)
        Global.id20=xread.readXML("slot",20)*/

        slot1.slotid=Global.id01
        slot2.slotid=Global.id02
        slot3.slotid=Global.id03
        slot4.slotid=Global.id04
        slot5.slotid=Global.id05
        slot6.slotid=Global.id06
        slot7.slotid=Global.id07

        slot1.swap(slot1.slotid)
        slot2.swap(slot2.slotid)
        slot3.swap(slot3.slotid)
        slot4.swap(slot4.slotid)
        slot5.swap(slot5.slotid)
        slot6.swap(slot6.slotid)
        slot7.swap(slot7.slotid)

    }

    function save(){
        xwrite.writeXML(shipid,slot1.slotid,slot2.slotid,slot3.slotid,slot4.slotid,slot5.slotid,slot6.slotid, slot7.slotid)
    }

    Xread{
        id:xread
    }
    Xwrite{
        id:xwrite
    }

    //dynamic insertion of modules
 function createswag(){
     for(var i=0;i<Global.module.count;i++){
         var component = Qt.createComponent("EditorModule.qml");
         var j = i+1;
         var k = i*200+50;
         var cannon="cannon"+j;
         var gunid=j;
         var x_spot=toprec.x+k;


         switch(j){
         case 1:
             var picsauce=Global.module.p1;
             break;
         case 2:
             var picsauce=Global.module.p2;
             break;
         default:
             break;
         }



         var sprite = component.createObject(toprec, {"id": cannon, "x_spot":x_spot, "picsource": picsauce, "gunid":gunid});
         console.debug(cannon,gunid,x_spot, picsauce);
         if (sprite == null) {
                 // Error Handling
                 console.log("Error creating object");
             }
     }
 }

}


