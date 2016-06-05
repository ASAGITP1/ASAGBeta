
import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0

import QtQuick 2.0 as QQ2

Scene3D {



  property variant rootEntity
  property variant rootEntityComponents

  property variant camera
  property variant cameraPosition
  property variant cameraUpVector
  property variant cameraViewCenter
  property variant cameraFarPlane

  property variant positionX
  property variant positionY
  property variant positionZ
  property variant upVectorX
  property variant upVectorY
  property variant upVectorZ
  property variant viewCenterX
  property variant viewCenterY
  property variant viewCenterZ


  property Transform worldTransform



  property bool isControlledCamera
  
  property FrameGraph frameGraph
  property variant activeFrameGraph


  property variant skybox
  property variant skyboxCameraRotationAngle
  property variant skyboxCameraRotationAxis
  property variant skyboxBaseName
  property variant skyboxExtension


  
  property variant rootEntityLoader
  
  property variant rootEntityLoaderSource
  property variant rootEntityLoadedEntity


}

