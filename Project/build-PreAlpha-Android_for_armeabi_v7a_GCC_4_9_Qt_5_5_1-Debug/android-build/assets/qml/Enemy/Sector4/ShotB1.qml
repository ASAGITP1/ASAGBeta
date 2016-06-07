import VPlay 2.0
import QtQuick 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../../Levels"


EntityBase {
    id: shotEntity
    entityType: "enemyshot"
    poolingEnabled: false

    z:99

    property double offset: 0
    property int dmg
    property string shottype
    property int inaccmod: 1

        Image {
            id:image
            source: "../../../assets/Sectors/Sector4/Enemies/rbshot.png"
            height: 50
            width: 50
        }


        BoxCollider {
            id: collider
            height: 10
            width: 15
            bullet: true
            categories: Box.Category1
            collidesWith: Box.Category4
        }

        Timer {
               interval: 500; running: true; repeat: true
               onTriggered: if(y > 2400) shotEntity.removeEntity()
        }

        Component.onCompleted: completed()


        function completed() {
            startPhys();
            selectShot();
        }

        function startPhys() {

            var speed = 400
            var inacc = Math.floor((Math.random() - 0.5) * 500) * inaccmod
            var targeting = Math.floor(speed * offset) + inacc
            collider.linearVelocity = Qt.point(targeting, speed)

            var tanval = speed / targeting
            var angle = Math.atan(tanval) * 57
            var rot = (angle < 0) ? (angle+90) : (angle-90)
            shotEntity.rotation = rot
        }

        function selectShot() {
            if(shottype == "enemy") {
                image.source = "../../assets/Sectors/Sector4/Enemies/rbshot.png";
            }
        }

 }


