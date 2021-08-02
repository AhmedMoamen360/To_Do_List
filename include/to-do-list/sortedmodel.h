#ifndef SORTEDMODEL_H
#define SORTEDMODEL_H

#include <QAbstractListModel>

struct Data {
    Data() {}
    Data(const QString& type, const QString& task) : type(type), task(task) {}
    QString type;
    QString task;
};

class SortedModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles{
        TypeRole,
        TaskRole
    };

    explicit SortedModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex& parent) const override;
    QVariant data( const QModelIndex& index, int role = Qt::DisplayRole ) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void duplicateData(int row);
    void removeData(int row);

private:
    QVector<Data> m_data;

};

#endif // SORTEDMODEL_H
