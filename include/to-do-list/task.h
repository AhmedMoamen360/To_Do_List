#pragma once

#include <QtCore/qstring.h>

class Task {

public:
	Task(const QString& type, const QString& task);
	QString getType() const;
	QString getTask() const;
	void setType(const QString& type);
	void setTask(const QString& task);

private:
	QString type;
	QString task;
};
