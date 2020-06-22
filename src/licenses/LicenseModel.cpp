#include "LicenseModel.h"

#include <QDirIterator>

#ifdef _WIN32
static const char *const platformRootPath = ":/licenses/windows/licenses/licenses/windows/licenses";
static const char *const qtRootPath = ":/licenses/windows/licenses/licenses/windows/licenses/qt";
static const char *const toolkitRootPath = ":/licenses/windows/licenses/licenses/windows/licenses/qt/licenses";
static const char *const webviewRootPath = ":/licenses/windows/licenses/licenses/windows/licenses/qt/licenses/qtwebengine/src/3rdparty/chromium";
#else
static const char *const platformRootPath = ":/licenses/linux/licenses/licenses/linux/licenses";
static const char *const qtRootPath = ":/licenses/linux/licenses/licenses/linux/licenses/qt";
static const char *const toolkitRootPath = ":/licenses/linux/licenses/licenses/linux/licenses/qt/licenses";
static const char *const webviewRootPath = ":/licenses/linux/licenses/licenses/linux/licenses/qt/licenses/qtwebengine/src/3rdparty/chromium";
#endif

static const char * getRootPath(LicenseType type) {
  if (type == LicenseType::WebView)
    return webviewRootPath;
  if (type == LicenseType::Toolkit)
    return toolkitRootPath;
  return platformRootPath;
}

LicenseModel::LicenseModel(LicenseType type, QObject *parent) :
    QAbstractItemModel(parent),
    m_type(type),
    m_dir(getRootPath(type)) {
  populate();
}

LicenseModel::~LicenseModel() = default;

void LicenseModel::populate() {
  switch (m_type) {
    case LicenseType::WebView: populateWebView(); break;
    case LicenseType::Toolkit: populateToolkit(); break;
    case LicenseType::Platform: populatePlatform(); break;
    case LicenseType::All: populateAll(); break;
  }
}

void LicenseModel::populateWebView() {
  const char *rootPath = webviewRootPath;
  QVector<QString> ignore_paths = {};
  populateFromRoot(rootPath, "Chromium", ignore_paths);
}

void LicenseModel::populateToolkit() {
  const char *rootPath = toolkitRootPath;
  QVector<QString> ignore_paths = { QString(webviewRootPath) };
  populateFromRoot(rootPath, "Qt", ignore_paths);

}

void LicenseModel::populatePlatform() {
  const char *rootPath = platformRootPath;
  QVector<QString> ignore_paths = { QString(qtRootPath) };
  populateFromRoot(rootPath, "Platform", ignore_paths);
}

void LicenseModel::populateAll() {
  const char *rootPath = platformRootPath;
  QVector<QString> ignore_paths = {};
  populateFromRoot(rootPath, "All", ignore_paths);
}

void LicenseModel::populateFromRoot(const char *rootPath, const char *rootName, QVector<QString> &ignore_paths) {
  QVector<QVariant> data = {QString(rootName)};
  rootItem = std::make_unique<LicenseItem>(data);

  QHash<QString, LicenseItem *> map;
  map[rootPath] = rootItem.get();

  QDirIterator it(m_dir, QDirIterator::Subdirectories);

  while (it.hasNext()) {
    QString path = it.next();

    bool should_skip = false;

    for (const auto & ignore: ignore_paths) {
      if (path.startsWith(ignore))
        should_skip = true;
    }

    if (should_skip)
      continue;

    const QFileInfo &fileInfo = it.fileInfo();
    LicenseItem *parent = map[fileInfo.dir().path()];

    QVector<QVariant> child_data = { fileInfo.fileName(), fileInfo.absoluteFilePath() };
    LicenseItem *child = new LicenseItem(child_data, parent);
    parent->appendChild(child);

    if (fileInfo.isDir())
      map[path] = child;
  }
}

QModelIndex LicenseModel::index(int row, int column, const QModelIndex &parent) const
{
  if (!hasIndex(row, column, parent))
    return QModelIndex();

  LicenseItem *parentItem;

  if (!parent.isValid())
    parentItem = rootItem.get();
  else
    parentItem = static_cast<LicenseItem*>(parent.internalPointer());

  LicenseItem *childItem = parentItem->child(row);
  if (childItem)
    return createIndex(row, column, childItem);
  return QModelIndex();
}

QModelIndex LicenseModel::parent(const QModelIndex &index) const
{
  if (!index.isValid())
    return QModelIndex();

  LicenseItem *childItem = static_cast<LicenseItem*>(index.internalPointer());
  LicenseItem *parentItem = childItem->parentItem();

  if (parentItem == rootItem.get())
    return QModelIndex();

  return createIndex(parentItem->row(), 0, parentItem);
}

int LicenseModel::rowCount(const QModelIndex &parent) const
{
  LicenseItem *parentItem;
  if (parent.column() > 0)
    return 0;

  if (!parent.isValid())
    parentItem = rootItem.get();
  else
    parentItem = static_cast<LicenseItem*>(parent.internalPointer());

  return parentItem->childCount();
}

int LicenseModel::columnCount(const QModelIndex &parent) const
{
  if (parent.isValid())
    return static_cast<LicenseItem*>(parent.internalPointer())->columnCount();
  return rootItem->columnCount();
}

QVariant LicenseModel::data(const QModelIndex &index, int role) const
{
  if (!index.isValid())
    return QVariant();

  if (role != Qt::DisplayRole && role != Qt::UserRole)
    return QVariant();

  LicenseItem *item = static_cast<LicenseItem*>(index.internalPointer());

  return item->data(role);
}

Qt::ItemFlags LicenseModel::flags(const QModelIndex &index) const
{
  if (!index.isValid())
    return Qt::NoItemFlags;

  return QAbstractItemModel::flags(index);
}

QVariant LicenseModel::headerData(int section, Qt::Orientation orientation,
                                  int role) const
{
  if (orientation == Qt::Horizontal && role == Qt::DisplayRole)
    return rootItem->data(section);

  return QVariant();
}

LicenseItem::LicenseItem(const QVector<QVariant> &data, LicenseItem *parent)
    : m_itemData(data), m_parentItem(parent)
{}

LicenseItem::~LicenseItem()
{
  qDeleteAll(m_childItems);
}

void LicenseItem::appendChild(LicenseItem *item)
{
  m_childItems.append(item);
}

LicenseItem *LicenseItem::child(int row)
{
  if (row < 0 || row >= m_childItems.size())
    return nullptr;
  return m_childItems.at(row);
}

int LicenseItem::childCount() const
{
  return m_childItems.count();
}

int LicenseItem::row() const
{
  if (m_parentItem)
    return m_parentItem->m_childItems.indexOf(const_cast<LicenseItem*>(this));

  return 0;
}

int LicenseItem::columnCount() const
{
  return m_itemData.count();
}

QVariant LicenseItem::data(int role) const
{
  switch (role) {
    case Qt::DisplayRole : return m_itemData.at(0);
    case Qt::UserRole : return m_itemData.at(1);
    default: return QVariant();
  }
}

LicenseItem *LicenseItem::parentItem()
{
  return m_parentItem;
}