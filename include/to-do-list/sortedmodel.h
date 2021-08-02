#ifndef SORTEDMODEL_H
#define SORTEDMODEL_H

#include <QSortFilterProxyModel>
#include "to-do-list/task.h"

class SortedModel : public QSortFilterProxyModel
{
    Q_OBJECT

public:
    enum Roles{
        TypeRole,
        TaskRole
    };

    explicit SortedModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex& parent) const override;
    QVariant data( const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void addTask(const QString& task);
    void editTaskType(const QString& task, int row);

protected:
    bool lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const override;

private:
    QVector<Task> tasks;

};

#endif // SORTEDMODEL_H
