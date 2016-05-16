import QtQuick 2.0
import VPlay 2.0 

QtObject {



  
  property variant gameNetworkItem



  property string deviceId

  property string facebookId

  
  property string facebookToken

  
  property bool facebookTokenValid



  property string authenticationToken
  
  property int timestamp

  
  property int userId
  
  property string name  
  
  property string displayName
  
  property string firstName
  property string lastName
  property string gender
  property string locale
  
  property string profileImageUrl
  
  property int profileImageId

  
  property string platform

  function getPlatformString() {
  }

  
  function getUserPropertyMap() {
  }

  
  function setUserPropertiesFromMap(userPropertiesMap) {
  }
}
