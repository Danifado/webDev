import 'package:flutter/material.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final List<String> items = List<String>.generate(100, (i) => "Item $i");
  String selectedItem = "Item 0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dirección',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 29, 228, 36),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: DropdownButton(
                          underline: SizedBox(),
                          value: selectedItem,
                          dropdownColor: Colors.green,
                          onChanged: (String? value) {
                            setState(() {
                              selectedItem = value!;
                            });
                          },
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.orange),
                        label: Text(''),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.check, color: Colors.orange),
                        label: Text(''),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
                ),
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
                      'Nombre:   Cristian \nDirección:   Calle falsa 123 \nTelefono:   123456789\nObservaciones:   \nAl ado de la cancha de futbol',
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
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 20, left: 23, right: 20),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(
                          "../../assets/images/testimg.jpeg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Producto',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Cantidad: 1',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 20, left: 23, right: 20),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(
                          "../../assets/images/testimg.jpeg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Producto',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Cantidad: 1',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 20, left: 23, right: 20),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(
                          "../../assets/images/testimg.jpeg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Producto',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Cantidad: 1',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Precio total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                      child: Text(
                        '15.000',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //Get.to(Pagina anterior());
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
