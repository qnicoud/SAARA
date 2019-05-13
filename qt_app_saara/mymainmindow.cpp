#include "mymainmindow.h"

MyMainWindow::MyMainWindow(QWidget *parent) : QMainWindow(parent)
{

    QMdiArea *m_centralZone = new QMdiArea(this);
    setCentralWidget(m_centralZone);

    createDocker();

    QMenu *m_menuFile = menuBar()->addMenu("&File");
        QAction *m_actionQuit = new QAction("&Quit", this);

        m_menuFile->addAction(m_actionQuit);

    QMenu *m_menuView = menuBar()->addMenu("&View");
        QAction *m_displayDock = new QAction("&Display dock", this);

        m_menuView->addAction(m_displayDock);

    QMenu *m_menuHelp = menuBar()->addMenu("&Help");
        // Fill in menu

    QStatusBar *m_statusBar = new QStatusBar(this);
        // Add temporary/normal/permanent messages

    QObject::connect(m_actionQuit, SIGNAL(triggered()), qApp, SLOT(quit()));
}

void MyMainWindow::createDocker()
{
    // Create the dock widget and restrain it to the left part of the application
    // Also, set the floating attribute to false
    QDockWidget *dockParam = new QDockWidget("Parameters:", this);
    dockParam->setAllowedAreas(Qt::LeftDockWidgetArea);
    dockParam->setFloating(false);
/*
    QVBoxLayout *dock_layout = new QVBoxLayout(this);
    QLabel * find_path = new QLabel("Path to data:", this);
    QString path_to_data = QFileDialog::getExistingDirectory(this);
    QLabel * find_temp = new QLabel("Path to template:", this);
    QString path_to_temp = QFileDialog::getExistingDirectory(this);

    QCheckBox *more_options = new QCheckBox("More options:", this);
    QCheckBox *do_stats = new QCheckBox("Do the stats:", this);
    QCheckBox *do_graphics = new QCheckBox("Do the graphics:", this);

    dock_layout->addWidget(find_path);
    dock_layout->addWidget(find_temp);
    dock_layout->addWidget(more_options);
    dock_layout->addWidget(do_stats);
    dock_layout->addWidget(do_graphics);
*/
    //dockParam->setLayout(dock_layout);

    addDockWidget(Qt::LeftDockWidgetArea, dockParam);
}
