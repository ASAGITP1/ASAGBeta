import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    id: holder

    property int realX: x + parent.x;
    property int realY: y + parent.y;


    z: 5

    property EntityBase player

    property var moduleList: moduleList

    property Component dynamicModule: moduleList.cmodule1

    Loader{
        sourceComponent:dynamicModule
    }

    ModuleList {
        id: moduleList
    }

}

