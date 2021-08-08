#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include "to-do-list/sortedtasks.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    SortedTasks * sortedModel = new SortedTasks;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("sortedTasks", sortedModel);
    engine.load(url);

    return app.exec();
}
