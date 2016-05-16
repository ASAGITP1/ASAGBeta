import QtMultimedia 5.4
import QtQuick 2.0

Item {
  property url source
  property bool autoPlay
  property bool looping
  property int position
  property int playbackState
  property int duration
  property int fillMode

  signal started
  signal paused
  signal stopped
  signal ended

  function play() {}

  function pause() {}

  function stop() {}

  function seek(offset) {}
}
