import QtQuick 1.1
import Sailfish.Silica 1.0

SilicaGridView {
    id: grid

    property real cellSize: Math.floor(width / columnCount)
    property int columnCount: isPortrait ? 3 : 5
    property bool highlightEnabled: true
    property bool unfocusHighlightEnabled
    property bool forceUnfocusHighlight
    property int _firstVisible: Math.max(0, grid.indexAt(0, contentY))
    property real _unfocusedOpacity: unfocusHighlightEnabled && (currentItem != null && currentItem.pressedAndHolded)
                                     || forceUnfocusHighlight
                                     ? 0.2 : 1.0
    Behavior on _unfocusedOpacity { FadeAnimation {} }


    currentIndex: -1
    cacheBuffer: 1000
    cellWidth: cellSize
    cellHeight: cellSize

    // Make header visible if it exists.
    Component.onCompleted: if (header) grid.positionViewAtBeginning()

    maximumFlickVelocity: 5000

    VerticalScrollDecorator { }

    HighlightItem {
        id: highlightItem
        width: grid.cellWidth
        height: grid.cellHeight
        objectName: "highlightItem"
        active: highlightEnabled && _unfocusedOpacity == 1 && grid.currentIndex > -1
                 && grid.currentItem.down
        x: grid.currentItem != null ? grid.currentItem.x : 0
        y: grid.currentItem != null ? grid.currentItem.y - grid.contentY : 0
        z: grid.currentItem != null ? grid.currentItem.z + 1 : 0
    }
}