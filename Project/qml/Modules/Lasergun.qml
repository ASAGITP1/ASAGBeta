import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseModule{
    id:lasergun

    property int shootingRange:         1800         // distance in pixel
    property double shootingAngle:      20          // angle on one side

    hp: 5
    maxhp: 5

    property int fakex: holder.x
    property int fakey: holder.y
    property int lasergunx: player.x + fakex
    property int laserguny: player.y + fakey

    property var erray: new Array


    Rectangle {
        color: "#DDDDDD"
        height: parent.height - 6
        width: parent.width - 6
        x: 3
        y: 3
    }

    Image {
        id:image
        source: working ? "../../assets/Player/cannon2.png" : "../../assets/Player/cannon2_broken.png"
        height: parent.height
        width: parent.width
        opacity: 0.8
    }

    Timer {
           interval: 1000; running: working; repeat: true
           onTriggered: trackingSystem()
       }


    function trackingSystem() {

        erray = entityManager.getEntityArrayByType("enemy");

        var ene;
        var targetArray = new Array;
        var j = 0;

        for(var i = 0; i < erray.length; i++) {

           ene = erray[i];

           var enemyDistance = laserguny - ene.y
           var angle = shootingAngle/57 // grad -> rad
           var offset = Math.tan(angle) * enemyDistance
           var lLimit = lasergunx - offset
           var rLimit = lasergunx + offset


            if(ene.x > lLimit && ene.x < rLimit && ene.y > (laserguny - shootingRange)) {
                targetArray[j] = ene;
                j++;
            }
        }

        if(j > 0) {

            var target = targetArray[0];

            var xdiff = target.x - lasergunx;
            var ydiff = target.y - laserguny;
            if(xdiff < 0) xdiff *=-1;
            var tDiff = Math.sqrt((xdiff*xdiff)+(ydiff*ydiff));

            for(var k = 0; k < targetArray.length; k++) {

                var xdiff2 = targetArray[k].x - lasergunx;
                var ydiff2 = targetArray[k].y - laserguny;
                if(xdiff2 < 0) xdiff2 *=-1;

                var ptDiff = Math.sqrt((xdiff2*xdiff2)+(ydiff2*ydiff2));
                if(tDiff > ptDiff) {
                    target = targetArray[k];
                }
            }

            shoot(target);
        }

    }


    function shoot(ene) {

        var offset = (lasergunx - (ene.x+(ene.width/2))) / (laserguny - ene.y)

       var newEntityProperties = {
            x: lasergunx + lasergun.width/2 - 10,
            y: laserguny - 20,
            offset: -offset,
            dmg: 5,
            shottype: "lasergun"
        }

        entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Player/Shot.qml"), newEntityProperties  )
    }



}
