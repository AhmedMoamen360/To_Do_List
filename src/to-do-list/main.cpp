#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include "to-do-list/sortedtasks.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }

    QGuiApplication app(argc, argv);
    qmlRegisterType<SortedTasks>("SortedTasks", 1, 0, "SortedTasks");

//    TaskModel * sortedModel = new TaskModel;

//    QQuickView view;
//    view.rootContext()->setContextProperty("sortedTasks", sortedModel);
//    view.setSource(QUrl("qrc:/qml/main.qml"));
//    view.show();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
