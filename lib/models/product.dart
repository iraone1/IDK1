class Product {
  final int id;
  final String name;
  final String pantone_value;
  final int year;

  Product({
    required this.id,
    required this.name,
    required this.pantone_value,
    required this.year,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      pantone_value: json['pantone_value'],
      year: json['year'],
    );
  }
}
