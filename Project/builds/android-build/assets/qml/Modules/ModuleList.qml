import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {

    property variant modules: ["", chaingun, lasergun, engines, module1]

    property Component chaingun: chaingun
    property Component lasergun: lasergun
    property Component engines: engines
    property Component cmodule1: module1

    QtObject {
        id: internalSettings
        property color color: "green"
    }

    Component {
        id: chaingun
        Chaingun {
            id: test
            height: 50
            width: 50

        }
    }


    Component {
        id: lasergun
        Lasergun {
            id: test
            height: 50
            width: 50

        }
    }

    Component {
        id: engines
        Engines {
            id: test
            height: 50
            width: 50

        }
    }


    Component {
        id: module1
        Module1 {

        }
    }
}

