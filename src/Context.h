#ifndef TURTLEBROWSER_CONTEXT_H
#define TURTLEBROWSER_CONTEXT_H

#include "licenses/LicenseFilter.h"
#include "licenses/LicenseModel.h"

class Context {
public:

  Context();

  LicenseFilter * searchModelWebLicenses() { return &m_filterLicenseModelWebView; }
  LicenseFilter * searchModelToolkitLicenses() { return &m_filterLicenseModelToolkit; }
  LicenseFilter * searchModelPlatformLicenses() { return &m_filterLicenseModelPlatform; }
  LicenseFilter * searchModelAllLicenses() { return &m_filterLicenseModelAll; }

private:
  LicenseModel m_licenseModel;
  LicenseFilter m_filterLicenseModelWebView;
  LicenseFilter m_filterLicenseModelToolkit;
  LicenseFilter m_filterLicenseModelPlatform;
  LicenseFilter m_filterLicenseModelAll;

  static void connectSearchModel(LicenseModel * model, LicenseFilter & search_model, LicenseCategory category);
};

#endif //TURTLEBROWSER_CONTEXT_H
