import VPlay 2.0 

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.1


ApplicationWindow {



  
  property variant gameWindow

  
  
  property variant state
  
  property variant states

  
  property variant settings

  
  property variant utils

  
  property string licenseKey

  
  signal splashScreenFinished()


  
  signal backButtonPressedGlobally()
  
  signal keyPressedGlobally(var event)

  
  property bool backButtonAutoAcceptGlobally


 
  property variant scaleMode

 
  property variant activeScene

  
  property bool resolutionChangingWithKeysEnabled
  property bool shutdownAppWithEscapeKeyEnabled


  property bool displayFpsEnabled

  property color displayFpsColor
  



  

 
 property bool tablet
 
 property bool portrait
 
 property bool landscape

 
 property real widthInInches
 
 property real heightInInches
 
 property real diameterInInches


 
 property real uiScale
 
 
 property real spScale
 
 property real dpScale


 
 function dp(value) {
  }

 
 function sp(value) {
  }

 
 function pixelToInches(pixel) {
  }

 
 function physicalPixels(pixel) {
  }


  
  property variant fullscreen

  
  property variant maximized




  
  signal applicationPaused

  
  signal applicationResumed
}
