#ifndef TURTLEBROWSER_CONTEXT_H
#define TURTLEBROWSER_CONTEXT_H

#include "licenses/LicenseModel.h"

#include <QtCore/QSortFilterProxyModel>

class Context {
public:

  Context();

  QSortFilterProxyModel * searchModelWebLicenses() { return &m_filterLicenseModelWebView; }
  QSortFilterProxyModel * searchModelToolkitLicenses() { return &m_filterLicenseModelToolkit; }
  QSortFilterProxyModel * searchModelPlatformLicenses() { return &m_filterLicenseModelPlatform; }
  QSortFilterProxyModel * searchModelAllLicenses() { return &m_filterLicenseModelAll; }

private:

  // License Models
  LicenseModel m_licenseModelWebView;
  LicenseModel m_licenseModelToolkit;
  LicenseModel m_licenseModelPlatform;
  LicenseModel m_licenseModelAll;

  // License Search Models
  QSortFilterProxyModel m_filterLicenseModelWebView;
  QSortFilterProxyModel m_filterLicenseModelToolkit;
  QSortFilterProxyModel m_filterLicenseModelPlatform;
  QSortFilterProxyModel m_filterLicenseModelAll;

  static void connectSearchModel(LicenseModel * model, QSortFilterProxyModel & search_model);
};

#endif //TURTLEBROWSER_CONTEXT_H
