import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sprint1/Models/product_model.dart';

import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 200,
        width: 500,
        child: ListView.builder(
          itemCount: controller.productos.length,
          itemBuilder: (BuildContext context, int index) {
            return CartScreenCard(
              controller: controller,
              producto: controller.productos.keys.toList()[index],
              cantidad: controller.productos.values.toList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CartScreenCard extends StatelessWidget {
  final CartController controller;
  final Producto producto;
  final int cantidad;
  final int index;

  CartScreenCard({
    Key? key,
    required this.controller,
    required this.producto,
    required this.cantidad,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 5, left: 20, right: 20),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(producto.nombre), Text("\$ ${producto.precio}")],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 5, left: 20, right: 5),
          child: IconButton(
            onPressed: () {
              controller.removeProductos(producto);
            },
            icon: Icon(
              Icons.remove_circle_rounded,
              color: Colors.orange,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 5),
          child: Text("${cantidad}"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 5, left: 5, right: 20),
          child: IconButton(
              onPressed: () {
                controller.addProductos(producto);
              },
              icon: Icon(
                Icons.add_circle_rounded,
                color: Colors.orange,
              )),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
