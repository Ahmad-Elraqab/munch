import 'package:flutter/foundation.dart';
import 'package:munch_app/models/product.dart';
import 'package:munch_app/services/data_service.dart';

import '../../dependency.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products;
  int selectedItem;
  final data = service<DataService>();

  Future<List<Product>> getProducts() async {
    products = await data.getProduct();

    return products;
  }

  Future<Product> getProductDetails() async {
    final product = await data.getProductDetailsServer(selectedItem);

    return product;
  }

  Future<List<Product>> getRecommendedProducts() async {
    final product = await data.getRecommendedProductsServer(1, 76, -1, -1, -1);

    return product;
  }
}