class ProdutoModel {
  final String? name;
  final String? detail;
  final String? price;
  final String? hero;
  final String? image;
  final String? info;
  final String? offer;

  ProdutoModel({
    required this.name,
    required this.detail,
    required this.price,
    required this.hero,
    required this.image,
    required this.info,
    required this.offer,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> map) {
    return ProdutoModel(
      name: map['name'],
      detail: map['detail'],
      price: map['price'],
      hero: map['hero'],
      image: map['image'],
      info: map['info'],
      offer: map['offer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'detail': detail,
      'price': price,
      'hero': hero,
      'image': image,
      'info': info,
      'offer': offer,
    };
  }
}
