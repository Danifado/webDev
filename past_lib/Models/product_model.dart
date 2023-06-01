import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  final String nombre;
  final int precio;
  final String imagenUrl;

  const Producto(
      {required this.nombre, required this.precio, required this.imagenUrl});

  static Producto fromSnapshot(DocumentSnapshot snap) {
    Producto producto = Producto(
      nombre: snap['nombre'],
      precio: snap['precio'],
      imagenUrl: snap['imagenUrl'],
    );
    print(producto.precio);
    return producto;
  }
  // static const List<Producto> productos = [
  //   Producto(
  //       nombre: 'Pasta',
  //       precio: 5000,
  //       imagenUrl:
  //           "https://plus.unsplash.com/premium_photo-1673809798970-30c14cfd0ab6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
  //   Producto(
  //       nombre: 'Lasagna',
  //       precio: 10000,
  //       imagenUrl:
  //           "https://images.unsplash.com/photo-1574894709920-11b28e7367e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"),
  //   Producto(
  //       nombre: 'Tacos',
  //       precio: 4000,
  //       imagenUrl:
  //           "https://images.unsplash.com/photo-1574894709920-11b28e7367e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"),
  // ];
}
