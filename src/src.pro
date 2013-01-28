
TEMPLATE = app
QT -= gui

CONFIG += link_pkgconfig
PKGCONFIG = commhistory

TARGET = "smsbackuprestore"

DEPENDPATH += .
INCLUDEPATH += .

HEADERS += util.h catcher.h
SOURCES += main.cpp util.cpp

PREFIX = /usr
BINDIR = $$PREFIX/bin
DATADIR =$$PREFIX/share

DEFINES += QT_USE_QSTRINGBUILDER

INSTALLS += target
target.path = $$BINDIR

