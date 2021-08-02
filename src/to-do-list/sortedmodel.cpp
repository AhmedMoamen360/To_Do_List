#include "to-do-list/sortedmodel.h"
#include <QByteArray>
#include <QDebug>

SortedModel::SortedModel(QObject *parent) : QSortFilterProxyModel(parent)
{
    tasks
        << Task("To Do", "Test")
        << Task("Completed", "Search")
        << Task("Completed", "Design")
        << Task("To Do", "Deploy")
        << Task("Completed", "Develop");

//    setDynamicSortFilter(true);
//    sort(0, Qt::DescendingOrder);
}

int SortedModel::rowCount(const QModelIndex &parent) const
{
    qsizetype size = parent.isValid() ? 0 : tasks.count();
    return size;
}

QVariant SortedModel::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() >= tasks.count())
        return QVariant();

    const Task& data = tasks[index.row()];
    switch (role) {
        case TypeRole:
            return data.getType();
        case TaskRole:
            return data.getTask();
        default:
            return QVariant();
    }
}

QHash<int, QByteArray> SortedModel::roleNames() const
{
    QHash<int, QByteArray> mapping;
    mapping.insert(TypeRole, "type");
    mapping.insert(TaskRole, "task");

    return mapping;
}

void SortedModel::addTask(const QString& task)
{

    const Task new_task("To Do", task);
    const int rowOfInsert = task.count();

    beginInsertRows(QModelIndex(), rowOfInsert, rowOfInsert);
    tasks.insert(rowOfInsert, new_task);
    endInsertRows();
}

void SortedModel::editTaskType(const QString& type, int row)
{
    tasks[row].setType(type);
}

bool SortedModel::lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const
{
    const QString leftTask = sourceLeft.data(TypeRole).toString();
    const QString rightTask = sourceRight.data(TypeRole).toString();

    return leftTask > rightTask;
}

