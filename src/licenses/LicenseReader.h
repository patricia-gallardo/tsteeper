#ifndef TURTLEBROWSER_LICENSEREADER_H
#define TURTLEBROWSER_LICENSEREADER_H

#include <QObject>

class LicenseReader : public QObject {
Q_OBJECT

public:
  explicit LicenseReader(QObject *parent = nullptr);

  ~LicenseReader() override = default;

  Q_INVOKABLE QString read(const QString &file);
};

#endif //TURTLEBROWSER_LICENSEREADER_H
