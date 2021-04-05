import 'package:flutter/foundation.dart';
import 'package:munch_app/models/product.dart';
import 'package:munch_app/services/data_service.dart';
import 'package:riverpod/riverpod.dart';

import '../dependency.dart';

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
}

final fetchProductProvider = Provider((ref) => ProductProvider());
final productsProvider = FutureProvider<List<Product>>(
  (ref) async {
    final httpClient = ref.read(fetchProductProvider);
    return httpClient.getProducts();
  },
);
final productDetaislProvider = FutureProvider.autoDispose<Product>(
  (ref) async {
    final httpClient = ref.read(fetchProductProvider);
    return httpClient.getProductDetails();
  },
);
