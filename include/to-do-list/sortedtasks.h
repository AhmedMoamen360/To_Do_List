#ifndef SORTEDTASKS_H
#define SORTEDTASKS_H

#include <QSortFilterProxyModel>
#include "to-do-list/taskmodel.h"

class SortedTasks : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    explicit SortedTasks(QObject *parent = nullptr);

public slots:
    void addTask(const QString& task);
    void editTaskType(const QString& type, int sorted_row);

protected:
    bool lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const override;

private:
    TaskModel* taskModel = new TaskModel;
};

#endif // SORTEDTASKS_H
