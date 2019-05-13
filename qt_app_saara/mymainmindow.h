#ifndef MYMAINMINDOW_H
#define MYMAINMINDOW_H

#include <QApplication>
#include <QWidget>

#include <QMainWindow>
#include <QMdiArea>

#include <QDockWidget>
#include <QFileDialog>

#include <QVBoxLayout>

#include <QMenu>
#include <QMenuBar>
#include <QAction>

#include <QLabel>
#include <QString>

#include <QCheckBox>

#include <QStatusBar>

//#include <RInside.h>

class MyMainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MyMainWindow(QWidget *parent = nullptr);


signals:

public slots:

private:
    QMdiArea *m_centralZone;

    QMenu *m_menuFile;
        QAction *m_actionSaveConfig;
        QAction *m_actionLoadConfig;
        QAction *m_actionQuit;

    QMenu*m_menuView;
        QAction *m_displayDock;

    QMenu *m_menuHelp;

    QStatusBar *m_statusBar;

    void createDocker();
};

#endif // MYMAINMINDOW_H
