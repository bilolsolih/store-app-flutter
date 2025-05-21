import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/product.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  List<ProductItem> products = [];

  Future<List<ProductItem>> fetchProductsList() async {
    final rawProducts = await client.genericGetRequest<List>('/products/list');
    products = rawProducts.map((product) => ProductItem.fromJson(product)).toList();
    return products;
  }

  Future<List<ProductItem>> saveProduct({required int productId}) async {
    var result = await client.genericPostRequest('/auth/save/$productId', data: null);
    if (result != null) {
      if (products.isNotEmpty) {
        var productIndex = products.indexWhere((product) => product.id == productId);
        products[productIndex] = products[productIndex].copyWith(isLiked: true);
      } else {
        final rawProducts = await client.genericGetRequest<List>('/products/list');
        products = rawProducts.map((product) => ProductItem.fromJson(product)).toList();
        return products;
      }
    }
    return products;
  }
}
