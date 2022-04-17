class ProductModel {
  String? name, description, price;
  int? available;
  String? abbreviation;

  ProductModel(
    this.name,
    this.description,
    this.available,
    this.price,
    this.abbreviation,
  );

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    String abbr = json['name'].split(" ");
    String abbrMain = abbr[0][0].toUpperCase() + abbr[1][0].toUpperCase();
    return ProductModel(
      json['name'],
      json['description'],
      json['available'],
      json['price'].toString(),
      abbrMain,
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> data) {
    var abbr = data['name'].split(" ");
    String abbrMain = abbr[0][0].toUpperCase() + abbr[1][0].toUpperCase();
    return ProductModel(
      data['name'],
      data['description'],
      data['available'],
      data['price'].toString(),
      abbrMain,
    );
  }

  static List<ProductModel> listFromJson(list) => List<ProductModel>.from(
      list['data'].map((x) => ProductModel.fromJson(x)));
}
