class Category {
  final String id;
  final String name;
  final String userId;
  final String? icon;
  final String? color;

  Category({
    required this.id,
    required this.name,
    required this.userId,
    this.icon,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'user_id': userId,
      'icon': icon,
      'color': color,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      userId: json['user_id'],
      icon: json['icon'],
      color: json['color'],
    );
  }
}