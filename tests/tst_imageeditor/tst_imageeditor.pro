TARGET = tst_imageeditor

include(../test_common.pri)
CONFIG += link_pkgconfig

CONFIG(use_quill) {
    PKGCONFIG += quill
} else {
    DEFINES += USE_QIMAGE
}

packagesExist(quillmetadata-qt5) {
    PKGCONFIG += quillmetadata-qt5
#    DEFINES += USE_QUILLMETADATA
}

INCLUDEPATH += ../../src/
SOURCES += tst_imageeditor.cpp \
    ../../src/declarativeimageeditor.cpp \
    ../../src/declarativeimageeditor_p.cpp

HEADERS += ../../src/declarativeimageeditor.h \
    ../../src/declarativeimageeditor_p.h
