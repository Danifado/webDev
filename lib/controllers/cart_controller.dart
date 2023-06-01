import 'package:get/get.dart';
import '../Models/product_model.dart';

class CartController extends GetxController {
  var _productos = {}.obs; // Mapa observado de productos
  Map ids = {}; // Mapa de ids de productos

  /// Retorna el mapa de los productos y la cantidad de cada uno
  get productos => _productos;

  /// Agrega un producto al carrito
  void addProductos(Producto producto) {
    if (_productos.containsKey(producto)) {
      // Si el producto ya existe en el carrito
      _productos[producto] += 1; // Incrementa la cantidad del producto en 1
      ids[producto.id] += 1; // Incrementa la cantidad del producto en 1 en ids
    } else {
      // Si el producto no existe en el carrito
      ids[producto.id] = 1; // Agrega el producto a ids con una cantidad de 1
      _productos[producto] =
          1; // Agrega el producto al carrito con una cantidad de 1
    }
  }

  /// Remueve un producto del carrito
  void removeProductos(Producto producto) {
    if (_productos.containsKey(producto) && _productos[producto] == 1) {
      // Si el producto existe en el carrito y su cantidad es 1
      _productos.removeWhere(
          (key, value) => key == producto); // Elimina el producto del carrito
      ids.removeWhere(
          (key, value) => key == producto.id); // Elimina el producto de ids
    } else {
      // Si el producto existe en el carrito y su cantidad es mayor a 1
      _productos[producto] -= 1; // Decrementa la cantidad del producto en 1
      ids[producto.id] -= 1; // Decrementa la cantidad del producto en 1 en ids
    }
  }

  /// Elimina completamente un producto del carrito
  void deleteProductos(Producto producto) {
    if (_productos.containsKey(producto)) {
      // Si el producto existe en el carrito
      _productos.removeWhere(
          (key, value) => key == producto); // Elimina el producto del carrito
    }
  }

  /// Calcula el subtotal de cada producto multiplicando su precio por su cantidad y lo devuelve como una lista
  get productSubtotal => _productos.entries
      .map((producto) => producto.key.precio * producto.value)
      .toList();

  /// Calcula el total sumando los subtotales de cada producto
  get total {
    num sum = 0; // Variable para almacenar la suma total
    _productos.entries
        .map((producto) => producto.key.precio * producto.value)
        .toList()
        .forEach((e) => sum +=
            e); // Calcula la suma total sumando los subtotales de cada producto
    return sum; // Devuelve la suma total
  }
}
