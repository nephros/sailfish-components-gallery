/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Mäkeläinen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

import QtQuick 1.1
import Sailfish.Silica 1.0
import Sailfish.Gallery 1.0

SplitViewDialog {
    id: aspectRatioDialog

    property bool avatarAspectRatio

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

    onDone: {
        if (result == DialogResult.Accepted) {
            cropView.crop()
        }
    }

    onSplitOpenedChanged: _verifyPageIndicatorVisibility(aspectRatioDialog)

    background: SilicaListView {
        anchors.fill: parent

        header: DialogHeader {
            dialog: aspectRatioDialog
        }

        delegate: LabelItem {
            text: model.text
            //: Label that is shown for currently selected aspect ratio.
            //% "Aspect ratio"
            sectionLabel: qsTrId("components_gallery-li-aspect_ratio")
            selected: cropView.aspectRatioType == model.type

            onClicked: {
                cropView.aspectRatio = model.ratio
                cropView.aspectRatioType = model.type
                aspectRatioDialog.splitOpen = !aspectRatioDialog.splitOpen
            }
        }

        model: AspectRatioModel {}
    }

    Component.onCompleted: _verifyPageIndicatorVisibility(aspectRatioDialog)
}