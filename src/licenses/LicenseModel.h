#ifndef TURTLEBROWSER_LICENSEMODEL_H
#define TURTLEBROWSER_LICENSEMODEL_H

#include <QtCore/QAbstractItemModel>
#include <QtCore/QDir>
#include <memory>

enum class LicenseType {
  WebView,
  Toolkit,
  Platform,
  All
};

class LicenseItem
{
public:
  explicit LicenseItem(const QVector<QVariant> &data, LicenseItem *parentItem = nullptr);
  ~LicenseItem();

  void appendChild(LicenseItem *child);

  LicenseItem *child(int row);
  int childCount() const;
  int columnCount() const;
  QVariant data(int role) const;
  int row() const;
  LicenseItem *parentItem();

private:
  QVector<LicenseItem*> m_childItems;
  QVector<QVariant> m_itemData;
  LicenseItem *m_parentItem;
};

class LicenseModel : public QAbstractItemModel {

public:
  LicenseModel(LicenseType type, QObject *parent = nullptr);

  ~LicenseModel() override;

  QModelIndex index(int row, int column, const QModelIndex &parent) const override;

  QModelIndex parent(const QModelIndex &child) const override;

  int rowCount(const QModelIndex &parent) const override;

  int columnCount(const QModelIndex &parent) const override;

  QVariant data(const QModelIndex &index, int role) const override;

  Qt::ItemFlags flags(const QModelIndex &index) const override;

  QVariant headerData(int section, Qt::Orientation orientation,
                      int role = Qt::DisplayRole) const override;

private:

  void populate();
  void populateWebView();
  void populateToolkit();
  void populatePlatform();
  void populateAll();
  void populateFromRoot(const char *rootPath, const char *rootName, QVector<QString> &ignore_paths);

  LicenseType m_type;
  QDir m_dir;
  std::unique_ptr<LicenseItem> rootItem;
};

#endif //TURTLEBROWSER_LICENSEMODEL_H
