/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Mäkeläinen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

import QtQuick 1.1
import Sailfish.Silica 1.0

Rectangle {
    property bool active
    property real highlightOpacity: 0.5

    color: theme.highlightBackgroundColor
    opacity: active ? highlightOpacity : 0.0
    Behavior on opacity {
        FadeAnimation {
            duration: 100
        }
    }
}