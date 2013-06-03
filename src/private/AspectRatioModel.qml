/****************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Raine Mäkeläinen <raine.makelainen@jollamobile.com>
**
****************************************************************************/

import QtQuick 1.1

ListModel {
    function _aspectRatio(index) {
        if (_aspectRatio["list"] === undefined) {
            _aspectRatio.list = [
                        {
                            //: Original aspect ratio
                            //% "Original"
                            text: qsTrId("components_gallery-li-aspect_ratio_original"),
                            ratio: -1.0,
                            type: "original"
                        },

                        {
                            //: Square aspect ratio
                            //% "Square"
                            text: qsTrId("components_gallery-li-aspect_ratio_square"),
                            ratio: 1.0,
                            type: "square"
                        },

                        {
                            //: Avatar aspect ratio
                            //% "Avatar"
                            text: qsTrId("components_gallery-li-aspect_ratio_avatar"),
                            ratio: 1.0, // separate this from square so that we can open people picker for avatars
                            type: "avatar"
                        },

                        {
                            //: 3:4 aspect ratio
                            //% "3:4"
                            text: qsTrId("components_gallery-li-aspect_ratio_3_4"),
                            ratio: 0.75,
                            type: "3:4"
                        },

                        {
                            //: 4:3 aspect ratio
                            //% "4:3"
                            text: qsTrId("components_gallery-li-aspect_ratio_4_3"),
                            ratio: 4/3,
                            type: "4:3"

                        }
                    ]
        }
        return _aspectRatio.list[index]
    }

    Component.onCompleted: {
        if (!avatarAspectRatio) {
            var index = 0
            for (; index < 5; ++index) {
                append(_aspectRatio(index))
            }
        } else {
            // Append only avatar aspect ratio
            append(_aspectRatio(2))
        }
    }
}