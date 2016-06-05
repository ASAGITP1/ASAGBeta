import VPlay 2.0
import QtQuick 2.0

Item {

  id: messageView
  property variant gameNetworkItem

  property int viewHeight

  property int viewWidth

  signal showCalled()

  signal chatActionPressed(var action, var data)

  function show(newState, initialState) {}
}

