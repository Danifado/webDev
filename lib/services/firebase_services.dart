import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/product_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

/// Retorna un Stream que emite una lista de productos obtenidos de la colección "Platos" en Firestore
class FirestoreDB {
  Stream<List<Producto>> getAllProductos() {
    return _firebaseFirestore.collection('Platos').snapshots().map(
      (Snapshot) {
        // Mapea cada documento en el Snapshot a un objeto Producto y los agrega a una lista
        return Snapshot.docs.map((doc) => Producto.fromSnapshot(doc)).toList();
      },
    );
  }

  /// Retorna un Stream que emite una lista de restaurantes obtenidos de la colección "restaurante" en Firestore
  Stream<List<Restaurante>> getRestName() {
    return _firebaseFirestore.collection('restaurante').snapshots().map(
      (Snapshot) {
        // Mapea cada documento en el Snapshot a un objeto Restaurante y los agrega a una lista
        return Snapshot.docs
            .map((doc) => Restaurante.fromSnapshot(doc))
            .toList();
      },
    );
  }
}

/// Agrega los datos de un pedido a la colección "pedido" en Firestore
Future<void> addPedidoData(String numPed, String idClient, String id) async {
  await _firebaseFirestore
      .collection('pedido')
      .doc(id)
      .set({"numPed": numPed, "usuarioId": idClient});
}

/// Agrega los datos de un pedido de un plato a la colección "pedido-plato" en Firestore
Future<void> addPedidoPlatoData(
    String pedidoId, String platoId, int cantidad) async {
  await _firebaseFirestore
      .collection('pedido-plato')
      .add({"pedidoId": pedidoId, "platoId": platoId, "cantidad": cantidad});
}

/// Agrega los datos de un cliente a la colección "datos" en Firestore
Future<void> addClientData(
    String name, String phone, String address, String obs, String id) async {
  await _firebaseFirestore.collection('datos').doc(id).set({
    "Direccion": address,
    "Nombre": name,
    "Observaciones": obs,
    "Telefono": phone
  });
}
