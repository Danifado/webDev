import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'final_page.dart';
import 'first_page.dart';
import 'package:sprint1/services/firebase_services.dart';
import 'resumen_productos.dart';
import 'package:measured_size/measured_size.dart';
import 'package:uuid/uuid.dart';

class Domicilios extends StatefulWidget {
  const Domicilios({super.key});

  @override
  _DomiciliosState createState() => _DomiciliosState();
}

class _DomiciliosState extends State<Domicilios> {
  var uuid = const Uuid();
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController observationsController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double wsize = 0;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Color.fromRGBO(255, 112, 2, 1),
            onPressed: () {
              Get.to(FistPage());
            }),
        centerTitle: true,
        title: const Text(
          "Escribir datos",
          style: TextStyle(
              fontFamily: 'RoboBol',
              color: Color.fromRGBO(255, 112, 2, 1),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 233, 224, 224), width: 2.5)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Texto de instrucciones
            Row(
              children: [
                Flexible(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          "Por favor indícanos tus datos para completar el pedido",
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Campo de nombre
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      constraints: BoxConstraints(
                          minWidth: scWidth - 80, maxWidth: scWidth - 50),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Escribe tu nombre",
                          labelText: "Nombre",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Campo de teléfono
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      constraints: BoxConstraints(
                          minWidth: scWidth - 50, maxWidth: scWidth - 30),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: "Escribe tu teléfono",
                          labelText: "Teléfono",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Campo de dirección
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      constraints: BoxConstraints(
                          minWidth: scWidth - 50, maxWidth: scWidth - 30),
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          hintText: "Escribe tu dirección",
                          labelText: "Dirección",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(255, 112, 2, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Campo de observaciones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: scWidth - 50, maxWidth: scWidth - 30),
                    child: TextFormField(
                      controller: observationsController,
                      decoration: InputDecoration(
                        hintText: "Observaciones para el domiciliario",
                        labelText: "Observaciones",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(
                            color: Color.fromRGBO(255, 112, 2, 1)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2.5,
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2.5,
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),

            // Título de "Menú seleccionado"
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "Menú seleccionado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'RoboBol'),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),

            // Contenedor del carrito de compras
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: scWidth - 50, maxWidth: scWidth - 20),
                    margin: const EdgeInsets.only(
                        top: 5.0, bottom: 20.0, left: 30.0, right: 30.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(255, 112, 2, 1), width: 1.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: SizedBox(
                      child: MeasuredSize(
                        onChange: (Size size) {
                          setState(
                            () {
                              wsize = size.width;
                            },
                          );
                        },
                        child: CartScreen(scWidth: wsize),
                      ),
                    ),
                  ),
                )
              ],
            ),

            // Botón para pedir el domicilio
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(239, 58, 58, 150)),
                      onPressed: () {
                        var id = uuid.v1();
                        addClientData(
                            nameController.text,
                            phoneController.text,
                            addressController.text,
                            observationsController.text,
                            id);
                        Get.to(FinalPage(), arguments: [
                          nameController.text,
                          phoneController.text,
                          addressController.text,
                          observationsController.text,
                          id
                        ]);
                      },
                      child: Text(
                        "PEDIR DOMICILIO",
                        style: TextStyle(
                          fontFamily: 'RoboReg',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
