/// A small product, the Dart version of a TypeScript object.
class Product {
  const Product({required this.name, required this.inStock});

  final String name;
  final bool inStock;
}

const List<Product> sampleProducts = [
  Product(name: 'Checkout', inStock: true),
  Product(name: 'Legacy cart', inStock: false),
  Product(name: 'Design system', inStock: true),
  Product(name: 'Search', inStock: true),
];

/// Same job as `products.filter(p => p.inStock).map(p => p.name)` in TypeScript.
/// The return type is fixed: this function can only return a list of strings.
List<String> inStockProductNames(List<Product> products) {
  return [
    for (final product in products)
      if (product.inStock) product.name,
  ];
}
