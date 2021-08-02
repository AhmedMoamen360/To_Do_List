#ifndef TASK_H
#define TASK_H
#include <QString>


class Task {

public:
    Task();
    Task(const QString& type, const QString& task);
    QString getType() const;
    QString getTask() const;
    void setType(const QString& type);
    void setTask(const QString& task);

private:
    QString type;
    QString task;
};

#endif // TASK_H
