import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'final_page.dart';
import 'first_page.dart';

class Domicilios extends StatefulWidget {
  const Domicilios({super.key});

  @override
  _DomiciliosState createState() => _DomiciliosState();
}

class _DomiciliosState extends State<Domicilios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Color.fromRGBO(255, 112, 2, 1),
            onPressed: () {
              Get.to(FistPage());
            }),
        centerTitle: true,
        title: Text("Escribir datos",
            style: TextStyle(
                fontFamily: 'RoboBol',
                color: Color.fromRGBO(255, 112, 2, 1),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 233, 224, 224), width: 2.5)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Por favor indicanos tus datos, para completar el pedido",
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 400.0,
                    child: IntrinsicWidth(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Escriba su nombre",
                          labelText: "Nombre",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 400.0,
                    child: IntrinsicWidth(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Escriba su teléfono",
                          labelText: "Teléfono",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 400.0,
                    child: IntrinsicWidth(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Escriba su dirección",
                          labelText: "Dirección",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 400.0,
                    child: IntrinsicWidth(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Observaciones para el domiciliario",
                          labelText: "Observaciones",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(255, 112, 2, 1)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromRGBO(
                                    255, 112, 2, 1)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, bottom: 20.0, left: 55.0, right: 55.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromRGBO(255, 112, 2, 1)),
                          borderRadius: BorderRadius.circular(2)),
                      child: Text("info")))
            ],
          ),
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
                      Get.to(FinalPage());
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
    );
  }
}
