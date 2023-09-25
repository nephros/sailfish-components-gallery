/****************************************************************************************
** Copyright (c) 2013 - 2023 Jolla Ltd.
** Copyright (c) 2023   Peter G. (nephros)
**
** All rights reserved.
**
** This file is part of Sailfish Transfer Engine component package.
**
** You may use this file under the terms of BSD license as follows:
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**
** 1. Redistributions of source code must retain the above copyright notice, this
**    list of conditions and the following disclaimer.
**
** 2. Redistributions in binary form must reproduce the above copyright notice,
**    this list of conditions and the following disclaimer in the documentation
**    and/or other materials provided with the distribution.
**
** 3. Neither the name of the copyright holder nor the names of its
**    contributors may be used to endorse or promote products derived from
**    this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
** DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
** SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
** CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
** OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************************/

import QtQuick 2.0

ListModel {
    // absolute
    ListElement {
        //: scale ratio
        //% "%1%%"
        text: qsTrId("components_gallery-li-scale_ratio_perc").arg(10)
        ratio: 0.9
        type: "ratio"
    }
    ListElement {
        //: scale ratio
        //% "%1%%"
        text: qsTrId("components_gallery-li-scale_ratio_perc").arg(20)
        ratio: 0.8
        type: "ratio"
    }
    ListElement {
        //: scale ratio
        //% "%1%%"
        text: qsTrId("components_gallery-li-scale_ratio_perc").arg(25)
        ratio: 0.75
        type: "ratio"
    }
    ListElement {
        //: scale ratio
        //% "%1%%"
        text: qsTrId("components_gallery-li-scale_ratio_perc").arg(50)
        ratio: 0.5
        type: "ratio"
    }
    // absolute
    ListElement {
        //: absolute pixel width
        //% "%1px"
        text: qsTrId("components_gallery-li-scale_absolute").arg(newWidth)
        newWidth: 1080
        type: "absolute"
    }
    ListElement {
        //: absolute pixel width
        //% "%1px"
        text: qsTrId("components_gallery-li-scale_absolute").arg(newWidth)
        newWidth: 1280
        type: "absolute"
    }
    ListElement {
        //: absolute pixel width
        //% "%1px"
        text: qsTrId("components_gallery-li-scale_absolute").arg(newWidth)
        newWidth: 2048
        type: "absolute"
    }

}