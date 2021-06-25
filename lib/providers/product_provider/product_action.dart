import 'package:munch_app/models/Category.dart';
import 'package:munch_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munch_app/providers/product_provider/product_provider.dart';
import 'package:munch_app/services/data_service.dart';

final categoryProvider = Provider((ref) => DataService());
final responseProvider = FutureProvider<List<Category>>(
  (ref) async {
    final httpClient = ref.read(categoryProvider);
    return httpClient.fetchCategory();
  },
);

final fetchRecommendedItemsProvider = Provider((ref) => DataService());
final itemsProvider = FutureProvider<List<Product>>(
  (ref) async {
    final httpClient = ref.read(fetchRecommendedItemsProvider);
    return httpClient.getRecommendedItems();
  },
);

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
final productRecommendedlProvider = FutureProvider.autoDispose<List<Product>>(
  (ref) async {
    final httpClient = ref.read(fetchProductProvider);
    return httpClient.getRecommendedProducts();
  },
);
