import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sprint1/Models/product_model.dart';

import '../controllers/cart_controller.dart'; // Importación del controlador cart_controller.dart

class CartScreen extends StatelessWidget {
  // Clase CartScreen que representa la pantalla del carrito
  final CartController controller =
      Get.find(); // Búsqueda del controlador de carrito existente
  final double scWidth; // Ancho de la pantalla

  CartScreen({Key? key, required this.scWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construcción de la interfaz de usuario
    return Obx(
      () => Container(
        height: 200,
        width: scWidth,
        child: ListView.builder(
          itemCount:
              controller.productos.length, // Número de productos en el carrito
          itemBuilder: (BuildContext context, int index) {
            return CartScreenCard(
                controller: controller,
                producto: controller.productos.keys.toList()[index],
                cantidad: controller.productos.values.toList()[index],
                index: index,
                scWidth: scWidth);
          },
        ),
      ),
    );
  }
}

/// Clase CartScreenCard que representa un elemento de producto en la pantalla del carrito
class CartScreenCard extends StatelessWidget {
  final CartController controller; // Controlador del carrito
  final Producto producto; // Producto
  final int cantidad; // Cantidad del producto
  final int index; // Índice del producto
  final double scWidth; // Ancho de la pantalla

  CartScreenCard({
    Key? key,
    required this.controller,
    required this.producto,
    required this.cantidad,
    required this.index,
    required this.scWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 0,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 3, right: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.network(
                producto.imagenUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 0,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(producto.nombre), Text("\$ ${producto.precio}")],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: IconButton(
              onPressed: () {
                controller.removeProductos(
                    producto); // Elimina el producto del carrito
              },
              icon: Icon(
                Icons.remove_circle_rounded,
                color: Color.fromRGBO(255, 112, 2, 1),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 0),
            child: Text("${cantidad}"), // Muestra la cantidad del producto
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: IconButton(
              onPressed: () {
                controller
                    .addProductos(producto); // Agrega el producto al carrito
              },
              icon: Icon(
                Icons.add_circle_rounded,
                color: Color.fromRGBO(255, 112, 2, 1),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: IconButton(
              onPressed: () {
                controller.deleteProductos(
                    producto); // Elimina el producto del carrito
              },
              icon: Icon(
                Icons.delete,
                color: Color.fromRGBO(255, 112, 2, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
