#include "to-do-list/sortedtasks.h"


SortedTasks::SortedTasks(QObject *parent) : QSortFilterProxyModel(parent)
{
	this->setSourceModel(&taskModel);
	setDynamicSortFilter(true);
	sort(0, Qt::DescendingOrder);
}

void SortedTasks::addTask(const QString &task)
{
	taskModel.addTask(task);
}

void SortedTasks::editTaskType(const QString &type, int sorted_row)
{
	const QModelIndex sortedIndex = index(sorted_row, 0, QModelIndex());
	const QModelIndex sourceIndex = mapToSource(sortedIndex);

	taskModel.editTaskType(type, sourceIndex.row());
}

void SortedTasks::editTask(const QString &task, int sorted_row)
{
	const QModelIndex sortedIndex = index(sorted_row, 0, QModelIndex());
	const QModelIndex sourceIndex = mapToSource(sortedIndex);

	taskModel.editTask(task, sourceIndex.row());
}

bool SortedTasks::lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const
{
	const QString leftData = sourceLeft.data(TaskModel::TypeRole).toString();
	const QString rightData = sourceRight.data(TaskModel::TypeRole).toString();

	return leftData > rightData;
}
