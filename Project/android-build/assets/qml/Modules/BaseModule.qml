import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

EntityBase {
        id: thisentity
        entityType: "basemodule"
        property int hp: 0
        property int maxhp: 0

        property bool working: true;

        z: 5


        BoxCollider {
            id: collider
            height: thisentity.height - 20
            width: thisentity.width - 20
            x: thisentity.parent.parent.realX + 10;
            y: thisentity.parent.parent.realY + 10;
            categories: Box.Category4
            collidesWith: Box.Category1
            sensor: true
            fixture.onBeginContact: {
                var body = other.getBody();
                var collidedEntity = body.target;
                var collidedEntityType = collidedEntity.entityType;
                getHit(other, collidedEntityType);
            }
        }

        function getHit(other, type) {
            if(type === "enemyshot" && working) {
                var dmg = other.getBody().target.dmg;
                hp -= dmg;
                other.getBody().target.removeEntity();
                if(hp <= 0)
                   working = false;
            }
        }
}

