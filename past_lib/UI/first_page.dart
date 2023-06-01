import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprint1/controllers/cart_controller.dart';
import 'package:sprint1/controllers/producto_controller.dart';
import 'dom_form.dart';
import 'productos_seleccionados.dart';
import 'carrito_total.dart';

import '../Models/product_model.dart';

import '../controllers/producto_controller.dart';
import '../controllers/cart_controller.dart';

class FistPage extends StatefulWidget {
  const FistPage({Key? key}) : super(key: key);

  @override
  _FisrtPageState createState() => _FisrtPageState();
}

class _FisrtPageState extends State<FistPage> {
  final productoControler = Get.put(ProductoControler());
  final ProductoControler productoControlerf = Get.find();
  final cartController = Get.put(CartController());
  int _counter = 0;
  var _name = "Nombre del Restaurante";
  num precio = 0;
  List db = [];

  void _increment() {
    setState(() {
      _counter++;
      precio = 5000 * _counter;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        precio = 5000 * _counter;
      }
    });
  }

  void _delete() {
    setState(() {
      _counter = 0;
      precio = 5000 * _counter;
    });
  }

  String dropdownvalue = "Menú 1";
  var items = [
    "Menú 1",
    "Menú 2",
    "Menú 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
            title: Text(_name),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            )),
        body: Column(
          children: [
            Row(children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 20, top: 20, left: 40, right: 20),
                child: Text("Por favor realiza tu pedido",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
              ),
            ]),
            Container(
              width: 450,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Color.fromRGBO(255, 112, 2, 1), width: 2),
                borderRadius: BorderRadius.circular(3),
              ),
              child: DropdownButton(
                underline: SizedBox(),
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(items,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold))),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 320,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
                itemCount: productoControler.productos.length,
                itemBuilder: (context, index) {
                  if (dropdownvalue == "Menú 1") {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          child: GestureDetector(
                            onTap: () {
                              cartController.addProductos(
                                  productoControlerf.productos[index]);
                              setState(() {});
                            },
                            child: Image.network(
                              productoControler.productos[index].imagenUrl,
                              height: 250,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(productoControler.productos[index].nombre +
                                " \$" +
                                productoControler.productos[index].precio
                                    .toString())
                          ],
                        ),
                      ],
                    );
                  } else if (dropdownvalue == "Menú 2") {
                    return buildCard2(index + 1);
                  } else if (dropdownvalue == "Menú 3") {
                    return buildCard3(index + 1);
                  } else {
                    return Center(
                      child: Text(""),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, top: 5, left: 20, right: 20),
                  child: Text(
                    "Menú seleccionado",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'RoboBol', fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CartScreen(),
                ),

                // Padding(
                //   padding:
                //       EdgeInsets.only(bottom: 20, top: 5, left: 20, right: 20),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.all(Radius.circular(100)),
                //     child: Image.asset(
                //       "../../assets/images/m1/1.jpg",
                //       height: 50,
                //       width: 50,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [Text("Producto 1"), Text("\$ 5000")],
                // ),
                // Padding(
                //   padding:
                //       EdgeInsets.only(bottom: 10, top: 5, left: 20, right: 5),
                //   child: IconButton(
                //       onPressed: _decrement,
                //       icon: Icon(
                //         Icons.remove_circle_rounded,
                //         color: Colors.orange,
                //       )),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10, top: 5),
                //   child: Text("$_counter"),
                // ),
                // Padding(
                //   padding:
                //       EdgeInsets.only(bottom: 10, top: 5, left: 5, right: 20),
                //   child: IconButton(
                //       onPressed: _increment,
                //       icon: Icon(
                //         Icons.add_circle_rounded,
                //         color: Colors.orange,
                //       )),
                // ),
                // IconButton(onPressed: _delete, icon: Icon(Icons.delete))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(bottom: 5, top: 5, left: 40, right: 20),
                    child: Text("Precio total",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'RoboBol',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 122, 122))))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: SizedBox(
                    height: 50,
                    width: 420,
                    child: CartTotal(),
                  ),
                ),
              ],
            ),
            Padding(
                padding:
                    EdgeInsets.only(bottom: 5, top: 20, left: 40, right: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(Domicilios());
                    },
                    child: Text("HACER PEDIDO",
                        style: TextStyle(fontFamily: 'RoboReg')),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(239, 58, 58, 150)))),
          ],
        ),
      ),
    );
  }

  Widget buildCard2(int index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            child: Image.asset(
              "../../assets/images/m2/$index.jpg",
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text("Producto $index \$ 5.000"),
        ],
      );
  Widget buildCard3(int index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            child: Image.asset(
              "../../assets/images/m3/$index.jpg",
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text("Producto $index \$ 5.000"),
        ],
      );
}
