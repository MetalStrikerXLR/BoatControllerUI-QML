#ifndef OUTPUTCONTROLLER_H
#define OUTPUTCONTROLLER_H

#include <QObject>

class OutputController : public QObject
{
    Q_OBJECT
public:
    explicit OutputController(QObject *parent = nullptr);
    ~OutputController();

signals:

private:

};

#endif // OUTPUTCONTROLLER_H
