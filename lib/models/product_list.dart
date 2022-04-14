import 'package:flutter/foundation.dart';
import 'package:shop/data/dummy_data.dart';

import 'product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items => [..._items]; // clone list, prevent modify list.

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
