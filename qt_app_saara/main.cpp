#include <QApplication>
#include "mymainmindow.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    MyMainWindow window;
    window.setWindowTitle("SAARA");
    window.show();

    return app.exec();
}
