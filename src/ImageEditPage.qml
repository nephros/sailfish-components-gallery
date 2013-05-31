/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Mäkeläinen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

import QtQuick 1.1
import Sailfish.Silica 1.0

SplitViewPage {
    id: imageEditor

    property alias source: cropView.source
    property alias target: cropView.target
    property alias cropping: cropView.cropping
    // To align this with SplitViewDialog
    property alias splitOpen: imageEditor.open
    property alias splitOpened: imageEditor.opened

    signal edited

    function _verifyPageIndicatorVisibility(splitView) {
        var enabled = true
        if (!splitView.splitOpened) {
            enabled = false
        }

        if (pageStack._pageStackIndicator) {
            pageStack._pageStackIndicator.enabled = enabled
        }
    }

    onSplitOpenedChanged: _verifyPageIndicatorVisibility(imageEditor)
    onStatusChanged: {
        if (status == PageStatus.Activating) {
            imageEditor.foreground = cropView
            cropView.resetParent(imageEditor.foregroundItem)
            cropView.splitView = imageEditor
            splitOpen = true
        }
    }

    background: SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            //: "Image editing page title"
            //% "Edit"
            title: qsTrId("components_gallery-he-edit")
        }

        delegate: BackgroundItem {
            IconButton {
                id: icon
                x: theme.paddingLarge
                icon.source: model.icon
                anchors.verticalCenter: parent.verticalCenter
            }

            Label {
                color: highlighted ? theme.highlightColor : theme.primaryColor
                text: model.text
                anchors {
                    left: icon.right
                    right: parent.right
                    rightMargin: theme.paddingLarge
                    verticalCenter: parent.verticalCenter
                }
            }

            onClicked: {
                if (model.type === "crop") {
                    cropView.splitView = pageStack.push(aspectRatioDialogComponent, {splitOpen: false})
                    cropView.resetParent(cropView.splitView.foregroundItem)
                }
            }
        }

        model: ImageEditOperationModel {}
    }

    // Shared between ImageEditPage and CropDialog so that state
    // of zoom is correct.
    foreground: CropView {
        id: cropView

        function resetParent(parentItem) {
            parent = null
            parent = parentItem
        }

        isPortrait: splitView.isPortrait
        splitView: imageEditor
        anchors.fill: parent
        showTitle: !splitView.splitOpen
        active: pageStack.currentPage === imageEditor ? false : !splitView.splitOpen
        explicitWidth: imageEditor.width
        explicitHeight: imageEditor.height
    }

    Component {
        id: aspectRatioDialogComponent
        CropDialog {
            allowedOrientations: imageEditor.allowedOrientations
            foreground: cropView
            onEdited: imageEditor.edited()
        }
    }

    Component.onCompleted: _verifyPageIndicatorVisibility(imageEditor)
}
