import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseLevel {
    id: level2
    levelName: "Level2"
    playerP: player


    property int totalSpawns: 10

      Timer {
          id: timer
          interval: 500; running: active; repeat: true
          onTriggered: spawnEnemy()
         }


      Component.onCompleted: {
          backgroundMusic.source = "../../assets/Music/Undaunted.mp3";
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
                  level: level2
              }

             entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy2.qml"), newEntityProperties  );
              currentSpawns++;
          } else {
                timer.running = false;
                state = STATE_NOSPAWNING
          }
      }


}

