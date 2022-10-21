#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QObject>
#include <QtGlobal>>
#include <QtMath>

class Triangle
{
    Q_OBJECT
public:
    Triangle();

    Q_INVOKABLE qreal calc(qreal a, qreal b, qreal c);

    void setA(qreal);
    void setB(qreal);
    void setC(qreal val);

    qreal getRes();
signals:
    void aValueChanged(qreal);
    void bValueChanged(qreal);
    void cValueChanged(qreal);
    void resValueChanged(qreal, qreal, qreal);

private:
    qreal a;
    qreal b;
    qreal c;
    qreal p;
    qreal res;
};

#endif // TRIANGLE_H
