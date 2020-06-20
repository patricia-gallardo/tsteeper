#include "licenses/LicenseReader.h"

#include <QDebug>
#include <QtCore/QFile>

LicenseReader::LicenseReader(QObject *parent) : QObject(parent) {}

QString LicenseReader::read(const QString &fileName) {
  if (fileName.isEmpty())
    return QString();

  QFile file(fileName);
  if ( file.open(QIODevice::ReadOnly | QFile::Text) ) {
    QTextStream t( &file );
    return t.readAll();
  }
  return QString();
}