#pragma once

#include "to-do-list/task.h"

#include <QtCore/QAbstractListModel>

class TaskModel : public QAbstractListModel
{
	Q_OBJECT

public:
	enum Roles{
		TypeRole,
		TaskRole
	};

	explicit TaskModel(QObject *parent = nullptr);
	int rowCount(const QModelIndex& parent) const override;
	QVariant data( const QModelIndex& index, int role = Qt::DisplayRole) const override;
	QHash<int, QByteArray> roleNames() const override;

public slots:
	void addTask(const QString& task);
	void editTaskType(const QString& type, int row);
	void editTask(const QString& task, int row);

private:
	QVector<Task> tasks;
};
