class AdminActionItem {
  final String id;
  final String title;
  final String description;
  final String targetRoute;
  final String iconName;

  AdminActionItem({
    required this.id,
    required this.title,
    required this.description,
    required this.targetRoute,
    required this.iconName,
  });

  factory AdminActionItem.fromMap(Map<String, dynamic> map) {
    return AdminActionItem(
      id: map['id']?.toString() ?? '',
      title: map['title'] as String? ?? 'Admin Action',
      description: map['description'] as String? ?? '',
      targetRoute: map['target_route'] as String? ?? '',
      iconName: map['icon_name'] as String? ?? 'settings',
    );
  }
}