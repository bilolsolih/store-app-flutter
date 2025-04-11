import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/product.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  Future<List<ProductItem>> fetchProductsList() async {
    final rawProducts = await client.genericGetRequest<List>('/products/list');
    return rawProducts.map((product) => ProductItem.fromJson(product)).toList();
  }
}
