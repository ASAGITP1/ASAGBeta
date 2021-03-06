import QtQuick 2.0
import VPlay 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../"
import "../../vars.js" as Global

BaseLevel {
    id: level4
    levelName: "Level4"
    playerP: player

    totalSpawns: 40





    ParallaxScrollingBackground {
          movementVelocity: Qt.point(0,30)
          ratio: Qt.point(1.0,1.0)
          opacity: 0.7
          sourceImage: "../../../assets/Sectors/Sector3/parallax1.png"
          sourceImage2: "../../../assets/Sectors/Sector3/parallax2.png"
        }

    ParallaxScrollingBackground {
          movementVelocity: Qt.point(0,10)
          ratio: Qt.point(1.0,1.0)
          opacity: 0.7
          sourceImage: "../../../assets/Sectors/Sector3/parallaxstars.png"
        }



      Timer {
          id: timer
          interval: 800; running: active; repeat: true
          onTriggered: spawnEnemy()
         }


      Component.onCompleted: {
          if(Global.mute==0){
              backgroundMusic.source = "../../assets/Music/Rhinoceros.mp3";
              backgroundMusic.play();
          }

          bgimg.source = "../../../assets/Sectors/Sector3/Background.png"
      }


      Player {
          id: player
          sceneP: scene
          x: 200
          damageObject: parent.damageObject
          y: parent.height - player.height - 100
          z: 20
      }



      function spawnEnemy() {
          if(currentSpawns < totalSpawns) {
              var newEntityProperties = {
                  x: Math.random() * (scene.width - 100) + 50,
                  y: 10,
                  player: playerP,
                  level: level4
              }

              if(Math.random() > 0.4) {
                entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../../Enemy/Sector3/Enemy1.qml"), newEntityProperties  );
              } else {
                  entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../../Enemy/Sector3/Enemy2.qml"), newEntityProperties  );
              }

              currentSpawns++;
          } else {
                timer.running = false;
                state = STATE_NOSPAWNING
          }
      }


}

