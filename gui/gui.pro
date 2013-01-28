
TEMPLATE = app

QT += declarative

TARGET = "smsbackuprestore_gui"

DEPENDPATH += .
INCLUDEPATH += .

SOURCES += gui.cpp
HEADERS += gui.h
RESOURCES += gui.qrc

PREFIX = /usr
BINDIR = $$PREFIX/bin
DATADIR = $$PREFIX/share

INSTALLS += target desktop icon

target.path = $$BINDIR

desktop.path = $$DATADIR/applications
desktop.files += $${TARGET}.desktop

icon.path = $$DATADIR/icons/hicolor/80x80/apps/
icon.files += $${TARGET}.png

