#include "include/to-do-list/sortedmodel.h"
#include <QByteArray>

SortedModel::SortedModel(QObject *parent) : QAbstractListModel(parent)
{
    m_data
        << Data("To Do", "Test")
        << Data("Completed", "Search")
        << Data("Completed", "Design")
        << Data("To Do", "Deploy")
        << Data("Completed", "Develop");
}

int SortedModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_data.count();
}

QVariant SortedModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    const Data& data = m_data.at(index.row());
    if(role == TypeRole)
        return data.type;
    else if(role == TaskRole)
        return data.task;
    else
        return QVariant();
}

QHash<int, QByteArray> SortedModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {TypeRole, "type"},
        {TaskRole, "task"}
    };
    return mapping;
}

void SortedModel::duplicateData(int row)
{

}

void SortedModel::removeData(int row)
{

}
