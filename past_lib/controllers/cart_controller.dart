import 'package:get/get.dart';
import '../Models/product_model.dart';
import 'package:collection/collection.dart';

class CartController extends GetxController {
  var _productos = {}.obs;

  void addProductos(Producto producto) {
    if (_productos.containsKey(producto)) {
      _productos[producto] += 1;
    } else {
      _productos[producto] = 1;
    }

    Get.snackbar("Producto anadido", "Anadiste ${producto.nombre} al carrito");
    SnackPosition:
    SnackPosition.BOTTOM;
    Duration:
    Duration(seconds: 2);
  }

  void removeProductos(Producto producto) {
    if (_productos.containsKey(producto) && _productos[producto] == 1) {
      _productos.removeWhere((key, value) => key == producto);
    } else {
      _productos[producto] -= 1;
    }
  }

  get productos => _productos;

  get productSubtotal => _productos.entries
      .map((producto) => producto.key.precio * producto.value)
      .toList();

  get total {
    num sum = 0;
    _productos.entries
        .map((producto) => producto.key.precio * producto.value)
        .toList()
        .forEach((e) => sum += e);
    return sum;
  }
}
