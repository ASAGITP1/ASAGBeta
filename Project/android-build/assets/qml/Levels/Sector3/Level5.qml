import QtQuick 2.0
import VPlay 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../"
import "../../vars.js" as Global

BaseLevel {
    id: level5
    levelName: "Level5"
    playerP: player

    totalSpawns: 1



    ParallaxScrollingBackground {
          movementVelocity: Qt.point(0,10)
          ratio: Qt.point(1.0,1.0)
          opacity: 0.7
          sourceImage: "../../assets/Sectors/Sector3/parallaxstars.png"
        }




      Timer {
          id: timer
          interval: 800; running: active; repeat: true
          onTriggered: spawnEnemy()
         }


      Component.onCompleted: {
          if(Global.mute==0){
              backgroundMusic.source = "../../../assets/Music/Rhinoceros.mp3";
              backgroundMusic.play();
          }
          bgimg.source = "../../../assets/Sectors/Sector3/Background.png"
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
                  x: 500,
                  y: 10,
                  player: playerP,
                  level: level5
              }

                entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../../Enemy/Sector3/Boss1.qml"), newEntityProperties  );

              currentSpawns++;
          } else {
                timer.running = false;
                state = STATE_NOSPAWNING
          }
      }


}

