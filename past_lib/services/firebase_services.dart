import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Producto>> getAllProductos() {
    return _firebaseFirestore.collection('Platos').snapshots().map(
      (Snapshot) {
        return Snapshot.docs.map((doc) => Producto.fromSnapshot(doc)).toList();
      },
    );
  }
}
