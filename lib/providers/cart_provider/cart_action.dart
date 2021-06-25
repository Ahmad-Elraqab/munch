import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_provider.dart';

final cartProvider = Provider((ref) => CartProvider());
final addToCart = Provider.family(
  (ref, item) {
    print(item);
    // final client = ref.read(cartProvider);
    // return client.addToCart(item);
  },
);
