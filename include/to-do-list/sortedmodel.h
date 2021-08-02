#ifndef SORTEDMODEL_H
#define SORTEDMODEL_H

#include <QAbstractListModel>

struct Data {
    Data() {}
    Data(const QString& name, const QString& type, const QString& task) : name(name), type(type), task(task) {}
    QString name;
    QString type;
    QString task;
};

class SortedModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles{
        NameRole = Qt::UserRole,
        TypeRole,
        TaskRole
    };

    explicit SortedModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex& parent) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void duplicateData(int row);
    void removeData(int row);

private:
    QVector<Data> m_data;

};

#endif // SORTEDMODEL_H
