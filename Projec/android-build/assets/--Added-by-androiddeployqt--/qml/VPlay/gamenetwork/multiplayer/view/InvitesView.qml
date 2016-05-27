import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {

    property variant gameNetworkItem

    property variant multiPlayerClient

    property variant inviteItemDelegate

    property variant inviteHeaderDelegate

    property variant invitesList


    property bool debugMode


    signal inviteClicked(variant inviteData)

}
