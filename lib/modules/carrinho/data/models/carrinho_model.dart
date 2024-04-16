class CarrinhoModel {
  int? id;
  final String? name;
  final String? detail;
  final String? price;
  final String? hero;
  final String? image;
  final String? info;
  final String? offer;
  final int? qntd;

  CarrinhoModel({
    this.id = 0,
    this.name,
    this.detail,
    this.price,
    this.hero,
    this.image,
    this.info,
    this.offer,
    this.qntd,
  });

  factory CarrinhoModel.fromJson(Map<String, dynamic> map) {
    return CarrinhoModel(
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
