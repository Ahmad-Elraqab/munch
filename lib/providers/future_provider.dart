import 'package:munch_app/models/Category.dart';
import 'package:munch_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
