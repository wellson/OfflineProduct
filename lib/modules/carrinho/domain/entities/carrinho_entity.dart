import 'package:objectbox/objectbox.dart';

@Entity()
class CarrinhoEntity {
  int? id;
  final String? name;
  final String? detail;
  final String? price;
  final String? hero;
  final String? image;
  final String? info;
  final String? offer;
  final int? qntd;

  CarrinhoEntity({
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
}
