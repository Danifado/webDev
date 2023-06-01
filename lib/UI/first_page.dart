import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprint1/controllers/cart_controller.dart';
import 'package:sprint1/controllers/producto_controller.dart';
import 'dom_form.dart';
import 'productos_seleccionados.dart';
import 'carrito_total.dart';
import 'package:measured_size/measured_size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import '../Models/product_model.dart';

// import '../controllers/producto_controller.dart';
// import '../controllers/cart_controller.dart';

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

  String dropdownvalue = "EWpPsRcP7jQsojEHYfkC";

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double wsize = 0;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromRGBO(255, 112, 2, 1),
            onPressed: () {},
          ),
          centerTitle: true,
          //${productoControler.restaurante[0].nombre}
          title: Text("Rest 1",
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
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 10, top: 10, left: 20, right: 10),
                    child: Text("Por favor realiza tu pedido",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                    minWidth: scWidth - 50, maxWidth: scWidth - 30),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(255, 112, 2, 1), width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('menu')
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<DropdownMenuItem> menuItems = [];
                      if (!snapshot.hasData) {
                        const CircularProgressIndicator();
                      } else {
                        final menus = snapshot.data?.docs.reversed.toList();
                        for (var menu in menus!) {
                          menuItems.add(
                            DropdownMenuItem(
                              value: menu.id,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  menu['nombre'],
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      return DropdownButton(
                        value: dropdownvalue,
                        underline: SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: menuItems,
                        onChanged: (menuValue) {
                          setState(() {
                            dropdownvalue = menuValue;
                          });
                        },
                      );
                    }),
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
                    if (dropdownvalue ==
                        productoControler.productos[index].menu) {
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
                    }
                    //else if (dropdownvalue == "menu 2" &&
                    //     productoControler.productos[index].menu == "Menu 2") {
                    //   return Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       ClipRRect(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             cartController.addProductos(
                    //                 productoControlerf.productos[index]);
                    //             setState(() {});
                    //           },
                    //           child: Image.network(
                    //             productoControler.productos[index].imagenUrl,
                    //             height: 250,
                    //             width: 250,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(height: 8),
                    //       Row(
                    //         children: [
                    //           Text(productoControler.productos[index].nombre +
                    //               " \$" +
                    //               productoControler.productos[index].precio
                    //                   .toString())
                    //         ],
                    //       ),
                    //     ],
                    //   );
                    // } else if (dropdownvalue == "menu 3" &&
                    //     productoControler.productos[index].menu == "Menu 3") {
                    //   return Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       ClipRRect(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             cartController.addProductos(
                    //                 productoControlerf.productos[index]);
                    //             setState(() {});
                    //           },
                    //           child: Image.network(
                    //             productoControler.productos[index].imagenUrl,
                    //             height: 250,
                    //             width: 250,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(height: 8),
                    //       Row(
                    //         children: [
                    //           Text(productoControler.productos[index].nombre +
                    //               " \$" +
                    //               productoControler.productos[index].precio
                    //                   .toString())
                    //         ],
                    //       ),
                    //     ],
                    //   );
                    // }
                    else {
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
                    padding: EdgeInsets.only(
                        bottom: 20, top: 5, left: 20, right: 20),
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
                  Container(
                    constraints: BoxConstraints(
                        minWidth: scWidth - 50, maxWidth: scWidth - 30),
                    child: MeasuredSize(
                        onChange: (Size size) {
                          setState(
                            () {
                              wsize = size.width;
                            },
                          );
                        },
                        child: CartScreen(scWidth: wsize)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 5, top: 5, left: 40, right: 20),
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
                    child: Container(
                      height: 50,
                      constraints: BoxConstraints(
                          minWidth: scWidth - 50, maxWidth: scWidth - 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 246, 250),
                        border: Border.all(
                          color: Color.fromRGBO(255, 112, 2, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: CartTotal(),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 20, left: 40, right: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(Domicilios(), arguments: dropdownvalue);
                      },
                      child: Text("HACER PEDIDO",
                          style: TextStyle(fontFamily: 'RoboReg')),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(239, 58, 58, 150)))),
            ],
          ),
        ),
      ),
    );
  }
}
