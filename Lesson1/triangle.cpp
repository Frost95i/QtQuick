#include "triangle.h"

Triangle::Triangle()
{

}

qreal Triangle::calc(qreal a, qreal b, qreal c)
{
    qreal p = (a + b + c) / 2;
    return qSqrt(p*(p-a)*(p-b)*(p-c));
}

void Triangle::setA(qreal val)
{
    a = val;
}

void Triangle::setB(qreal val)
{
    b = val;
}

void Triangle::setC(qreal val)
{
    c = val;
}

qreal Triangle::getRes()
{
    return res;
}
