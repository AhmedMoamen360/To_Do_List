#include "to-do-list/sortedmodel.h"
#include <QByteArray>

SortedModel::SortedModel(QObject *parent) : QAbstractListModel(parent)
{
    tasks
        << Task("To Do", "Test")
        << Task("Completed", "Search")
        << Task("Completed", "Design")
        << Task("To Do", "Deploy")
        << Task("Completed", "Develop");
}

int SortedModel::rowCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : tasks.count();
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

    const QModelIndex startIndex = index(0, 0);
    const QModelIndex endIndex   = index(tasks.count() - 1, 0);
    emit dataChanged(startIndex, endIndex, QVector<int>() << TypeRole);
}

