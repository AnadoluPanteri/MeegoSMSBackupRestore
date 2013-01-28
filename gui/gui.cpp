
/**
 * MeeGo SMS Backup Restore GUI
 * 2013-01-28 Thomas Perl <m@thp.io>
 * Released under the same license terms as the original MeegoSMSBackupRestore.
 **/

#include "gui.h"

Controller::Controller()
    : QObject(NULL)
{
}

void
Controller::backup(QString filename)
{
    Worker *worker = new Worker(this, Controller::BACKUP, filename);
    worker->start();
}

void
Controller::restore(QString filename)
{
    Worker *worker = new Worker(this, Controller::RESTORE, filename);
    worker->start();
}

void
Controller::finished(int result)
{
    if (result == 0) {
        emit success();
    } else {
        emit failure();
    }
}

Worker::Worker(Controller *controller, Controller::Operation operation, QString filename)
    : QThread(),
      m_controller(controller),
      m_operation(operation),
      m_filename(filename)
{
}

void
Worker::run()
{
    QStringList args;
    args << ((m_operation == Controller::BACKUP) ? "export" : "import");
    args << m_filename;

    int result = QProcess::execute("smsbackuprestore", args);
    m_controller->finished(result);

    deleteLater();
}

int
main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Controller controller;

    QDeclarativeView view;
    view.rootContext()->setContextProperty("controller", &controller);
    view.setSource(QUrl("qrc:/gui.qml"));
    view.showFullScreen();

    return app.exec();
}

