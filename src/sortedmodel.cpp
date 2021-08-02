#include "sortedmodel.h"
#include <QByteArray>

SortedModel::SortedModel(QObject *parent) : QObject(parent)
{

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
    if(role == NameRole)
        return data.name;
    else if(role == TypeRole)
        return data.type;
    else if(role == TaskRole)
        return data.task;
    else
        return QVariant();
}

QHash<int, QByteArray> SortedModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {NameRole, "name"},
        {TypeRole, "type"},
        {TaskRole, "task"}
    };
    return mapping;
}
