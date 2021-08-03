#include "to-do-list/sortedtasks.h"


SortedTasks::SortedTasks(QObject *parent)
{
    sort(0, Qt::DescendingOrder);
    setDynamicSortFilter(true);
    this->setSourceModel(taskModel);
}

void SortedTasks::addTask(const QString &task)
{
    taskModel->addTask(task);
}

void SortedTasks::editTaskType(const QString &task, int row)
{
    taskModel->editTaskType(task, row);
}

bool SortedTasks::lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const
{
    const QString leftData = sourceLeft.data(TaskModel::TypeRole).toString();
    const QString rightData = sourceRight.data(TaskModel::TypeRole).toString();

    return leftData > rightData;
}
