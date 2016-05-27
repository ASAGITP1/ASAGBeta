import VPlay 2.0
import QtQuick 2.0



Item {


  
  
  property variant gameNetworkItem

  
  property int viewHeight
  
  property int viewWidth
  
  
  property int viewMargin

  
  
  property string initialStateBeforeShow
  


  
  property variant pushedStatesStack

  
  
  signal backClicked()

  
  signal showCalled()




  
  
  property string subState


  
  property variant leaderboardView
  
  property variant achievementView
  
  property variant challengeView
  
  property variant friendsView
  
  property variant profileView

  
  
  property variant achievementDelegate
  
  property variant leaderboardHeaderDelegate
  
  property variant leaderboardItemDelegate

  
  property variant showLeaderboardsHeaderIcon
  
  property variant showAchievementsHeaderIcon
  
  property variant showMoreHeaderIcon

  
  property int loadingCounter


  
  property color tintColor

  
  property color tintLightColor
  
  property color bodyColor
  
  property color bodyLightColor
  
  property color separatorColor

  

  
  property variant headerFontSource
  
  property variant bodyFontSource
  
  property variant iconFontSource

  
  
  

  



  




  






  
  function show(newState, initialState) {
  }

}
