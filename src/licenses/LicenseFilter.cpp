#include "LicenseFilter.h"

#include <QDebug>
#include <QtCore/QFile>

LicenseFilter::LicenseFilter(QObject *parent) : QSortFilterProxyModel(parent) {}

QString LicenseFilter::readFile(const QModelIndex &index) {

  QString fileName = sourceModel()->data(mapToSource(index), Qt::UserRole).toString();

  if (fileName.isEmpty())
    return QString();

  QFile file(fileName);
  if ( file.open(QIODevice::ReadOnly | QFile::Text) ) {
    QTextStream t( &file );
    return t.readAll();
  }
  return QString();
}