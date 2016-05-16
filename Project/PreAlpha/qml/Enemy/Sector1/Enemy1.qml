import VPlay 2.0
import QtQuick 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../../Levels"

EntityBase{
    id:enemy
    entityType: "enemy"
    width: 75
    height: 75
    z: 20
    property int hp: 20
    property bool killed: false

    property int shootingRange:         1000         // distance in pixel
    property double shootingAngle:      20          // angle on one side

    property Player player;
    property int playerX: player.x + player.width/2;
    property int playerY: player.y + player.width/2;

    property BaseLevel level


    Image {
        id:image
        source: "../../../assets/Sectors/Sector1/Enemies/Enemy1.png"
         anchors.fill: parent
    }


    BoxCollider {
        id: collider
        height: parent.height
        width: parent.width
        categories: Box.Category3
        collidesWith: Box.Category1 | Box.Category2
        sensor: true
        fixture.onBeginContact: {
            var body = other.getBody();
            var collidedEntity = body.target;
            var collidedEntityType = collidedEntity.entityType;
            getHit(other, collidedEntityType);
        }
    }

    Component.onCompleted: startPhys()


    Timer {
           interval: 1000; running: true; repeat: true
           onTriggered: trackingSystem()
       }


    function trackingSystem() {

       var yDistance = enemy.y - playerY
       var angle = shootingAngle/57 // grad -> rad
       var offset = Math.tan(angle) * yDistance
       var lLimit = enemy.x + offset
       var rLimit = enemy.x - offset

       if(playerX > lLimit && playerX < rLimit && playerY < (enemy.y + shootingRange)) {
            shoot(player);
       }

    }


    function shoot(player) {

        var offset = (enemy.x - playerX) / (enemy.y - playerY)

        var newEntityProperties = {
            x: enemy.x + enemy.width/2 - 5,
            y: enemy.y + enemy.height + 50,
            z: 10,
            offset: offset,
            dmg: 1,
            shottype: "eshot1"
        }

       entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("Shot1.qml"), newEntityProperties  )
    }





    function startPhys() {
        collider.linearVelocity = Qt.point(0, 120)
    }

    function getHit(other, type) {
        if(type === "shot") {
            var dmg = other.getBody().target.dmg;
            hp -= dmg;
            other.getBody().target.removeEntity();
            if(hp <= 0 && !killed) {
                killed = true;
                enemy.removeEntity();
                level.kills ++;
                level.checkVictory();
            }
        }
    }
}


