import VPlay 2.0
import QtQuick 2.0


Item{
  id: mutiplayer

  property var invitees : []

  property var players : []

  property int playerCount

  property bool initialized: false

  property string appKey

  property variant gameNetworkItem

  property string room

  signal playerJoined(string playerid)

  signal playerLeft(string playerid)

  property bool startGameWhenReady

  signal gameStarted

  property bool gameInProgress :false

  signal playersReady

  signal initFinished(var invited)

  signal initFailed(var reason)

  signal messageReceived(var player, var code, var message)

  signal gameLeft(var room)

  signal turnStarted(var playerId)

  signal myTurnStarted()

  signal playerChanged(var player)

  property bool myTurn

  property bool amLeader

  property variant activePlayer

  property variant localPlayer

  property variant leaderPlayer

  property variant connectedPlayers

  property int turnMessageId

  property int turnMessageResponseId

  function createGame(sendInvitesToPlayers){}

  function leaveGame(){}

  function initialisePlayers(){}

  function joinGame(){}

  property string inviteMessage

  signal invitesSent()

  function sendInvites(){}

  function forceStartGame(){}

  function getPlayerForuserId(userId){}

  function leaderCode(callback) {}

  function sendMessage(code, message) {}

  function sendTurnMessage(message) {}

  function showMatchmaking() {}

  function showInvitesList() {}

  function showFriendSelector() {}
}




