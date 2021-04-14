import 'package:flutter/foundation.dart';
import 'package:munch_app/models/product.dart';
import 'package:riverpod/riverpod.dart';

class CartProvider extends ChangeNotifier {
  Map products;
  int itemsCount;

// {
// 	"CustomerId":"32548",
// 	"CustomerGuid":"9E4C448C-A45E-4C75-A557-37193354DC86",
// 	"StoreId":"1",
// 	"Price":"5.00",
// 	"Quantity":"10",
// 	"ProductId":2,
// 	"MarkAsDeleted":0,
// 	"ShoppingCartId":-1,
// 	"OrderDate":"7/11/2020",
// 	"CityId":"-1",
// 	"DistrictId":"-1",
// 	"ZoneId":"3"
// }
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
