import VPlay 2.0
import QtQuick 2.0
import "Scenes"
import "Editor"

GameWindow {
    id: gameWindow


    //licenseKey: "<generate one from http://v-play.net/licenseKey>"

    activeScene: mainmenuscene

    property GameScene gameScene: gamescene

    width: 1080
    height: 1920




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
          name: "sectorselectscene"
          PropertyChanges {target: sectorselectscene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: sectorselectscene}
        },
        State {
          name: "levelselectscene1"
          PropertyChanges {target: levelselectscene1; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: levelselectscene1}
        },
        State {
          name: "levelselectscene2"
          PropertyChanges {target: levelselectscene2; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: levelselectscene2}
        },
        State {
          name: "levelselectscene3"
          PropertyChanges {target: levelselectscene3; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: levelselectscene3}
        },
        State {
          name: "levelselectscene4"
          PropertyChanges {target: levelselectscene4; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: levelselectscene4}
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

    SectorSelectScene {
        id: sectorselectscene
        scenemaster: gameWindow
    }

    LevelSelectScene1 {
        id: levelselectscene1
        scenemaster: gameWindow
    }

    LevelSelectScene2 {
        id: levelselectscene2
        scenemaster: gameWindow
    }

    LevelSelectScene3 {
        id: levelselectscene3
        scenemaster: gameWindow
    }

    LevelSelectScene4 {
        id: levelselectscene4
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
            state = "levelselectscene"
            break;
        case 3:             // Ship Editor
            state = "gamescene"
            break;
        case 4:             // Game Scene
            state = "editor"
            break;
        }
    }

}

