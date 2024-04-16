import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:produtos/modules/carrinho/domain/entities/carrinho_entity.dart';

import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store _store;

  late final Box<CarrinhoEntity> _cartBox;

  ObjectBox._create(this._store) {
    _cartBox = Box<CarrinhoEntity>(_store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore(
        directory: p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  List<CarrinhoEntity> getCarrinho() {
    final allProd = _cartBox.getAll();
    return allProd;
  }

  Future<void> addProduct({
    required String? name,
    required String? detail,
    required String? price,
    required String? hero,
    required String? image,
    required String? info,
    required String? offer,
    required int? qntd,
    int? id,
  }) =>
      _cartBox.putAsync(
        CarrinhoEntity(
          name: name,
          detail: detail,
          price: price,
          hero: hero,
          image: image,
          info: info,
          offer: offer,
          qntd: qntd,
          id: id,
        ),
      );

  Future<void> removeProduct(int id) => _cartBox.removeAsync(id);
  void removeAllProduct() => _cartBox.removeAll();
}
