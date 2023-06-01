import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Center(
          child: Text(
              "\$${controller.total}"), // Mostrar el valor total del carrito utilizando el controlador
        ),
      ),
    );
  }
}
