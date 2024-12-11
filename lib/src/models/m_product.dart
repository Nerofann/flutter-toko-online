class Product {
  late List<Products> products;

  Product({required this.products});
  Product.fromJson(Map<String, dynamic> json) {
    products = List.from(json['products']).map((e) => Products(productId: e['id'], productTitle: e['title'], productImage: e['images'][0])).toList();
  }
}

class Products {
  int? productId;
  String? productTitle;
  String? productImage;

  Products({this.productId, this.productImage, this.productTitle});
  Products.fromJson(Map<String, dynamic> json) {
    productId: json['id'];
    productTitle: json['title'];
    productImage: json['images'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = productId;
    data['title'] = productTitle;
    data['images'] = productImage;
    return data;
  }
}