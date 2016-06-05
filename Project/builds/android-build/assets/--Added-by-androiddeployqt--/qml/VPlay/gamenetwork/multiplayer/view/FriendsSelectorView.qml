import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    id: friendsSelectorView

    property variant gameNetworkItem

    property int maxSelectionCount

    property variant selected

    signal cellSelected(var cell)

    property bool singleSelection:false

}
