/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Mäkeläinen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Gallery 1.0

SplitViewDialog {
    id: aspectRatioDialog

    property bool avatarCrop

    signal edited
    signal cropRequested

    // Clip zoomed part of the image
    clip: true
    onDone: {
        if (result == DialogResult.Accepted) {
            cropRequested()
        }
    }

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
                aspectRatioDialog.splitOpen = !aspectRatioDialog.splitOpen
                cropView.aspectRatio = model.ratio
                cropView.aspectRatioType = model.type
            }
        }

        model: AspectRatioModel {}
    }

    Binding {
        target: pageStack._pageStackIndicator
        property: "enabled"
        value: aspectRatioDialog.splitOpened
        when: aspectRatioDialog.status === PageStatus.Activating || aspectRatioDialog.status === PageStatus.Active
    }
}
