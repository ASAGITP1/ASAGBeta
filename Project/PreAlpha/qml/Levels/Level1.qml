import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseLevel {
    id: level1
    levelName: "Level1"
    playerP: player

    totalSpawns: 30


      Timer {
          id: timer
          interval: 400; running: active; repeat: true
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
                  level: level1
              }

             entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy.qml"), newEntityProperties  );
              currentSpawns++;
          } else {
                timer.running = false;
                state = state_NOSPAWNING
          }
      }

}

