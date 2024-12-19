class Product {
  final int id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

final List<Product> products = [
  Product(id: 0, name: "Smartphone", price: 99.9),
  Product(id: 1, name: "Tablet", price: 199.9),
  Product(id: 2, name: "Laptop", price: 259.9),
  Product(id: 3, name: "Microphone", price: 19.9),
  Product(id: 4, name: "Keyboard", price: 399.9),
  Product(id: 5, name: "Ring Light", price: 29.9),
  Product(id: 6, name: "Swivel Chair", price: 499.9),
  Product(id: 7, name: "Clipper", price: 15.9),
  Product(id: 8, name: "Tiktok Mic", price: 5.9),
];
