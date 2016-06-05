import QtQuick 2.0
import VPlay 2.0


import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../"
import "../../vars.js" as Global

BaseLevel {
    id: level2
    levelName: "Level2"
    playerP: player


    totalSpawns: 30





    ParallaxScrollingBackground {
          movementVelocity: Qt.point(0,30)
          ratio: Qt.point(1.0,1.0)
          opacity: 1
          z: 6
          sourceImage: "../../../assets/Sectors/Sector1/background1.png"
          sourceImage2: "../../../assets/Sectors/Sector1/background2.png"
        }

    ParallaxScrollingBackground {
          movementVelocity: Qt.point(0,10)
          ratio: Qt.point(1.0,1.0)
          opacity: 1
          z: 7
          sourceImage: "../../assets/Sectors/Sector1/enemyhorde.png"
        }



      Timer {
          id: timer
          interval: 500; running: active; repeat: true
          onTriggered: spawnEnemy()
         }


      Component.onCompleted: {
          bgimg.source = "";
          bgimg.visible = false;
          bgimg.update();

          if(Global.mute==0){
              backgroundMusic.source = "../../../assets/Music/A Night Of Dizzy Spells.mp3";
              backgroundMusic.play();
          }
      }


      Player {
          id: player
          sceneP: scene
          damageObject: parent.damageObject
          x: 200
          y: parent.height - player.height - 100
          z: 20
      }



      function spawnEnemy() {
          if(currentSpawns < totalSpawns) {
              var newEntityProperties = {
                  x: Math.random() * (scene.width - 100) + 50,
                  y: 10,
                  player: playerP,
                  level: level2
              }

             entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../../Enemy/Sector1/Enemy1.qml"), newEntityProperties  );
              currentSpawns++;
          } else {
                timer.running = false;
                state = STATE_NOSPAWNING
          }
      }


}

