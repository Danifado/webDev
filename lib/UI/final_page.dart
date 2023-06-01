import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprint1/UI/carrito_total.dart';
import 'package:sprint1/UI/resumen_productos.dart';
import 'package:sprint1/services/firebase_services.dart';
import 'package:uuid/uuid.dart';
import '../controllers/producto_controller.dart';
import '../controllers/cart_controller.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final CartController cartController = Get.find();
  final productoController = Get.put(ProductoControler());

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();
    double scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(255, 112, 2, 1),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text("Facturacion",
            style: TextStyle(
                fontFamily: 'RoboBol',
                color: Color.fromRGBO(255, 112, 2, 1),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 233, 224, 224), width: 2.5)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10, top: 20, left: 23, right: 20),
                      child: Text('Datos del pedido',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: 'RoboBol')),
                    ),
                  ],
                ),

                // Contenedor para mostrar los datos del pedido
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 246, 250),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 2.0, color: Colors.orange),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 450.0,
                    maxWidth: 450.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Nombre:   ${Get.arguments[0]} \nDirección:   ${Get.arguments[2]} \nTelefono:   ${Get.arguments[1]}\nObservaciones: \n${Get.arguments[3]} ',
                      style: TextStyle(fontSize: 15, fontFamily: 'RoboReg'),
                    ),
                  ),
                ),

                Text(
                  'Pedido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Contenedor para mostrar el carrito de compras
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 5.0, bottom: 20.0, left: 55.0, right: 55.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 112, 2, 1),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: SizedBox(
                          child: CartScreen(scWidth: scWidth),
                        ),
                      ),
                    )
                  ],
                ),

                Text(
                  'Precio total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Contenedor para mostrar el total del carrito de compras
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 2.0, color: Colors.orange),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 450.0,
                    maxWidth: 450.0,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CartTotal()),
                  ),
                ),

                // Botón para realizar el pedido por WhatsApp
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          var numPed = uuid.v4();
                          var pedidoId = uuid.v4();
                          addPedidoData(numPed, Get.arguments[4], pedidoId);
                          for (var v in cartController.ids.keys) {
                            addPedidoPlatoData(
                                pedidoId, v, cartController.ids[v]);
                          }
                        },
                        icon: Image.asset(
                            '../../assets/images/whatsapp_logo.png',
                            width: 35,
                            height: 35),
                        label: Text(''),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
