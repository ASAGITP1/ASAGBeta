import VPlay 2.0
import QtQuick 2.0
import "Scenes"

GameWindow {
    id: gameWindow


    //licenseKey: "<generate one from http://v-play.net/licenseKey>"

    activeScene: mainmenuscene

    width: 640
    height: 960




    // default state is menu -> default scene is menuScene
    state: "menu"

    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
      State {
        name: "menu"
        PropertyChanges {target: mainmenuscene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: mainmenuscene}
      },
      State {
        name: "gamescene"
        PropertyChanges {target: gamescene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gamescene}
      },
      State {
          name: "editor"
          PropertyChanges {target: editorscene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: editorscene}
      }
    ]




    MainMenuScene {
        id: mainmenuscene
        scenemaster: gameWindow
    }

    GameScene {
        id: gamescene
        scenemaster: gameWindow
    }

    Editor {
        id: editorscene
        scenemaster: gameWindow
    }

    function switchScene(newscene) {
        switch(newscene) {
        case 1:             // Main Menu
            state = "menu"
            break;
        case 2:             // Game Scene
            state = "gamescene"
            break;
        case 3:             // Ship Editor
            state = "editor"
            break;
        }
    }

}

