#include "to-do-list/task.h"

Task::Task()
{

}

Task::Task(const QString& type, const QString& task) : type(type), task(task)
{

}

QString Task::getType() const
{
    return type;
}

QString Task::getTask() const
{
    return task;
}

void Task::setType(const QString &type)
{
    this->type = type;
}

void Task::setTask(const QString &task)
{
    this->task = task;
}
