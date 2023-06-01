import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sprint1/Models/product_model.dart';

import '../controllers/cart_controller.dart';

/// Clase CartScreen que representa la pantalla del carrito
class CartScreen extends StatelessWidget {
  final CartController controller =
      Get.find(); // Búsqueda del controlador de carrito existente
  final double scWidth; // Ancho de la pantalla

  CartScreen({Key? key, required this.scWidth}) : super(key: key);

  @override

  /// Construcción de la interfaz de usuario
  Widget build(BuildContext context) {
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
              scWidth: scWidth,
            );
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
    // Construcción de la interfaz de usuario
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0, top: 5, left: 0, right: 30),
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
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(producto.nombre), // Muestra el nombre del producto
                  Text(
                      "\$ ${producto.precio}") // Muestra el precio del producto
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 5, top: 5, right: 0),
              child: Text("${cantidad}"), // Muestra la cantidad del producto
            ),
          ],
        ),
        Divider(
          height: 20,
          color: Color.fromRGBO(255, 112, 2, 1),
          thickness: 1.5,
          indent: 0,
          endIndent: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [], // Lista vacía, se pueden agregar elementos aquí según sea necesario
        ),
      ],
    );
  }
}
