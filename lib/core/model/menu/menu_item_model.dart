enum MenuItemEnum {
  orders,
  menu,
  report,
  notification,
  account,
  logout,
}

class MenuItemModel {
  final String icon;
  final String title;
  final MenuItemEnum type;
  final bool isBadge;

  MenuItemModel(
      {required this.icon,
      required this.title,
      required this.type,
      this.isBadge = false});
}
