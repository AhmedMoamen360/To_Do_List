#include "to-do-list/sortedtasks.h"

#include <QtQml/qqmlapplicationengine.h>
#include <QtQml/qqmlcontext.h>
#include <QtGui/qguiapplication.h>
#include <QtQuick/qquickview.h>

int main(int argc, char *argv[])
{
	SortedTasks sortedModel;

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
		&app, [url](QObject *obj, const QUrl &objUrl) {
			if (!obj && url == objUrl)
				QCoreApplication::exit(-1);
		}, Qt::QueuedConnection);
	engine.rootContext()->setContextProperty("sortedTasks", &sortedModel);
	engine.load(url);

	return app.exec();
}
