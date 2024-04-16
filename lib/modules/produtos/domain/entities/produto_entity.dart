import 'package:objectbox/objectbox.dart';

@Entity()
class ProdutoEntity {
  int id;
  final String? name;
  final String? detail;
  final String? price;
  final String? hero;
  final String? image;
  final String? info;
  final String? offer;

  ProdutoEntity({
    this.id = 0,
    required this.name,
    required this.detail,
    required this.price,
    required this.hero,
    required this.image,
    required this.info,
    required this.offer,
  });
}
