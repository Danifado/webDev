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
        height: 20,
        width: 350,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 246, 250),
          border: Border.all(
            color: Color.fromRGBO(255, 112, 2, 1),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text("${controller.total}"),
        ),
      ),
    );
  }
}
