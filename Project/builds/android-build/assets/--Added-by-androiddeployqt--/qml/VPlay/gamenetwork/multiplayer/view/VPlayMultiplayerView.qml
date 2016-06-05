import VPlay 2.0
import QtQuick 2.0

Item {

  id: multiplayerView

  property variant gameNetworkItem

  property int viewHeight

  property int viewWidth

  signal showCalled()

  signal backClicked()

  function show(newState, initialState) {}
}

