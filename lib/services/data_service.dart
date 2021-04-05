import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:munch_app/models/Category.dart';
import 'package:munch_app/models/product.dart';

class DataService {
  Future<List<Category>> fetchCategory() async {
    final data = await http.get(
        'https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryCategories/1');

    final jsonData = jsonDecode(data.body) as List;
    print(jsonData);

    final List<Category> list = [];
    jsonData.forEach(
      (e) => list.add(
        Category.fromJson(e),
      ),
    );

    return list;
  }

  Future fetchImage(String url) async {
    final data = await http.get(url);

    final jsonData = data.body;

    return jsonData;
  }

  Future<List<Product>> getRecommendedItems() async {
    final data = await http.get(
        'https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryRecommendedProducts/');

    final jsonData = jsonDecode(data.body) as List;
    print(jsonData);

    final List<Product> list = [];
    jsonData.forEach(
      (e) => list.add(
        Product.fromJson(e),
      ),
    );

    return list;
  }

  Future<List<Product>> getProduct() async {
    final data = await http.get(
        'https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryProducts/1/-1/76/-1/-1');

    final jsonData = jsonDecode(data.body) as List;
    print(jsonData);

    final List<Product> list = [];
    jsonData.forEach(
      (e) => list.add(
        Product.fromJson(e),
      ),
    );

    return list;
  }

  Future<Product> getProductDetailsServer(int id) async {
    final data = await http.get(
        'https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryProductDetails/${id}/1');

    final jsonData = jsonDecode(data.body);
    print(jsonData);

    return Product.fromJson(jsonData as Map<String, dynamic>);
  }
}
