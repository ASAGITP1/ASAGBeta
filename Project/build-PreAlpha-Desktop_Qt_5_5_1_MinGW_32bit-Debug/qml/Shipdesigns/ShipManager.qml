import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    property Component ship1:ship1
    property Component ship2:ship2
    property Component ship3:ship3


    Component{
        id:ship1
        Ship1 {
            id:l_ship1
        }
    }
    Component{
        id:ship2
        Ship2 {
            id:l_ship2
        }
    }
    Component{
        id:ship3
        Ship3 {
            id:l_ship3
        }
    }
}

