import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  final String id;
  final String nombre;
  final int precio;
  final String imagenUrl;
  final String menu;

  const Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagenUrl,
    required this.menu,
  });

  /// Método estático para crear una instancia de Producto a partir de un DocumentSnapshot
  static Producto fromSnapshot(DocumentSnapshot snap) {
    Producto producto = Producto(
      id: snap.id,
      nombre: snap['nombre'],
      precio: snap['precio'],
      imagenUrl: snap['imagenUrl'],
      menu: snap['menu'],
    );
    return producto;
  }
}

class Restaurante {
  final String nombre;

  const Restaurante({
    required this.nombre,
  });

  /// Método estático para crear una instancia de Restaurante a partir de un DocumentSnapshot
  static Restaurante fromSnapshot(DocumentSnapshot snap) {
    Restaurante restaurante = Restaurante(
      nombre: snap['nombre'],
    );
    return restaurante;
  }
}

class Pedido {
  final String id;
  final String numPed;
  final String usuarioId;

  const Pedido({
    required this.id,
    required this.numPed,
    required this.usuarioId,
  });

  /// Método estático para crear una instancia de Pedido a partir de un DocumentSnapshot
  static Pedido fromSnapshot(DocumentSnapshot snap) {
    Pedido pedido = Pedido(
      id: snap.id,
      numPed: snap['numPed'],
      usuarioId: snap['usuarioId'],
    );
    return pedido;
  }
}

class Pedido_plato {
  final String id;
  final String pedidoId;
  final String platoId;

  const Pedido_plato({
    required this.id,
    required this.pedidoId,
    required this.platoId,
  });

  /// Método estático para crear una instancia de Pedido_plato a partir de un DocumentSnapshot
  static Pedido_plato fromSnapshot(DocumentSnapshot snap) {
    Pedido_plato pedido_plato = Pedido_plato(
      id: snap.id,
      pedidoId: snap['pedidoId'],
      platoId: snap['platoId'],
    );
    return pedido_plato;
  }
}
