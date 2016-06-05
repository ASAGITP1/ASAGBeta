import QtQuick 2.0
import VPlay 2.0

import "../../Enemy"
import "../../Modules"
import "../../Player"
import "../../Scenes"
import "../"
import "../../vars.js" as Global

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
          bgimg.source = "../../../assets/Sectors/Sector3/Background.png";
          bgimg.update();

          if(Global.mute==0){
              backgroundMusic.source = "../../../assets/Music/Rhinoceros.mp3";
              backgroundMusic.play();
          }
      }


      ParallaxScrollingBackground {
          id: parallax1
            movementVelocity: Qt.point(0,35)
            ratio: Qt.point(1.0,1.0)
            opacity: 0.7
            z: 5
            sourceImage: "../../../assets/Sectors/Sector3/parallax1.png"
            sourceImage2: "../../../assets/Sectors/Sector3/parallax2.png"
          }

      ParallaxScrollingBackground {
          id: parallax2
            movementVelocity: Qt.point(0,10)
            ratio: Qt.point(1.0,1.0)
            opacity: 0.7
            z: 4
            sourceImage: "../../../assets/Sectors/Sector3/parallaxstars.png"
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
                  level: level1
              }

             entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../../Enemy/Sector3/Enemy1.qml"), newEntityProperties  );
              currentSpawns++;
          } else {
                timer.running = false;
                state = state_NOSPAWNING
          }
      }

}

