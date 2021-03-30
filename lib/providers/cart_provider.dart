import 'package:flutter/foundation.dart';
import 'package:munch_app/models/product.dart';
import 'package:riverpod/riverpod.dart';

class CartProvider extends ChangeNotifier {
  Map products;
  int itemsCount;

  void addToCart(Product product) {
    if (!products.containsKey(product)) {
      products[product] = 1;
    } else {
      products[product] += 1;
    }
    print(products);
  }
}

final cartProvider = Provider((ref) => CartProvider());
final addToCart = Provider.family(
  (ref, item) {
    print(item);
    // final client = ref.read(cartProvider);
    // return client.addToCart(item);
  },
);
