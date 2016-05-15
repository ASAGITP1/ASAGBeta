import QtQuick 2.0
import VPlay 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../"

BaseLevel {
    id: level4
    levelName: "Level4"
    playerP: player

    totalSpawns: 20


      Timer {
          id: timer
          interval: 800; running: active; repeat: true
          onTriggered: spawnEnemy()
         }


      Component.onCompleted: {
          backgroundMusic.source = "../../assets/Music/Rhinoceros.mp3";
          backgroundMusic.play();
      }


      Player {
          id: player
          sceneP: scene
          x: 200
          y: parent.height - player.height - 100
          z: 20
      }



      function spawnEnemy() {
          if(currentSpawns < totalSpawns) {
              var newEntityProperties = {
                  x: Math.random() * 500 + 50,
                  y: 10,
                  player: playerP,
                  level: level4
              }

              if(Math.random() > 0.5) {
                entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Sector1/Enemy.qml"), newEntityProperties  );
              } else {
                  entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Sector1/Enemy2.qml"), newEntityProperties  );
              }

              currentSpawns++;
          } else {
                timer.running = false;
                state = STATE_NOSPAWNING
          }
      }


}

