#ifndef TURTLEBROWSER_LICENSEFILTER_H
#define TURTLEBROWSER_LICENSEFILTER_H

#include <QtCore/QSortFilterProxyModel>

class LicenseFilter : public QSortFilterProxyModel {
Q_OBJECT

public:

  explicit LicenseFilter(QObject *parent = nullptr);

  Q_INVOKABLE QString readFile(const QModelIndex &index);
};

#endif //TURTLEBROWSER_LICENSEFILTER_H
