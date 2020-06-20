#include "Context.h"

Context::Context() :
    m_licenseModelWebView(LicenseType::WebView),
    m_licenseModelToolkit(LicenseType::Toolkit),
    m_licenseModelPlatform(LicenseType::Platform),
    m_licenseModelAll(LicenseType::All)
{
  connectSearchModel(&m_licenseModelWebView, m_filterLicenseModelWebView);
  connectSearchModel(&m_licenseModelToolkit, m_filterLicenseModelToolkit);
  connectSearchModel(&m_licenseModelPlatform, m_filterLicenseModelPlatform);
  connectSearchModel(&m_licenseModelAll, m_filterLicenseModelAll);
}

void Context::connectSearchModel(LicenseModel * model, QSortFilterProxyModel & search_model) {
  search_model.setSourceModel(model);
  search_model.sort(0);
  search_model.setFilterKeyColumn(0);
  search_model.setFilterRole(Qt::DisplayRole);
  search_model.setRecursiveFilteringEnabled(true);
}
