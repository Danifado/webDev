import 'package:get/get.dart';
import 'package:sprint1/Models/product_model.dart';
import 'package:sprint1/services/firebase_services.dart';

class ProductoControler extends GetxController {
  final productos = <Producto>[].obs; // Lista observable de productos
  final restaurante = <Restaurante>[].obs; // Lista observable de restaurantes

  @override
  void onInit() {
    productos.bindStream(FirestoreDB()
        .getAllProductos()); // Vincula el stream de productos desde FirestoreDB al observable productos
    restaurante.bindStream(FirestoreDB()
        .getRestName()); // Vincula el stream de restaurantes desde FirestoreDB al observable restaurante
    super.onInit();
  }
}
