import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:munch_app/models/Category.dart';
import 'package:munch_app/models/product.dart';
import 'package:munch_app/models/user.dart';

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

  Future<List<Product>> getRecommendedProductsServer(int langId, int cityId,
      int districtId, int zoneId, int customerGuid) async {
    final data = await http.post(
      'https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryRecommendedProducts/',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "langId": langId,
        "CityId": cityId,
        "DistrictId": districtId,
        "ZoneId": zoneId,
        "CustomerGuid": customerGuid,
      }),
    );
    final jsonData = jsonDecode(data.body);

    final jsonDataList =
        jsonData['GetMunchBakeryRecommendedProductsResult'] as List;
    print(jsonDataList);

    final List<Product> list = [];
    jsonDataList.forEach(
      (e) => list.add(
        Product.fromJson(e),
      ),
    );

    return list;
  }

  Future<User> loginServer(
    String username,
    String password,
  ) async {
    final data = await http.post(
      'https://api.munchbakery.com/MunchBakeryAPIService.svc/ValidateMunchBakeryLogin/',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "UserNameEmail": username,
          "Password": password,
          "OldGuestCustomerGuid": "",
          "DeviceSourceType": "2",
          "MobileTokenId": "token"
        },
      ),
    );

    final json = jsonDecode(data.body);

    print(json);

    return User.fromJson(json);
  }
}
