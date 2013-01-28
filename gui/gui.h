#ifndef SMSBACKUPRESTORE_GUI_H
#define SMSBACKUPRESTORE_GUI_H

/**
 * MeeGo SMS Backup Restore GUI
 * 2013-01-28 Thomas Perl <m@thp.io>
 * Released under the same license terms as the original MeegoSMSBackupRestore.
 **/

#include <QtGui>
#include <QtDeclarative>

class Controller : public QObject {
    Q_OBJECT

    public:
        Controller();

        enum Operation {
            BACKUP,
            RESTORE,
        };

        void finished(int result);

    public slots:
        void backup(QString filename);
        void restore(QString filename);

    signals:
        void success();
        void failure();
};

class Worker : public QThread {
    Q_OBJECT

    public:
        Worker(Controller *controller, Controller::Operation operation, QString filename);

    protected:
        void run();

    private:
        Controller *m_controller;
        Controller::Operation m_operation;
        QString m_filename;
};

#endif /* SMSBACKUPRESTORE_GUI_H */
