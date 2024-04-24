class SharedItem<T> {
  String name;
  String email;
  int order;
    SharedItem({
    required this.name,
    required this.email,
    required this.order
  });

  factory SharedItem.fromJson(Map<String, dynamic> json) {
  return SharedItem<T>
    (name: json['name'],
    email: json['name'], 
    order: json['order']);
  }
}