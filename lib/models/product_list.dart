import 'package:flutter/foundation.dart';
import 'package:shop/data/dummy_data.dart';

import 'product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems => _items.where((p) => p.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
  
  int get itemsCount {
    return _items.length;
  }
}


/*bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((p) => p.isFavorite).toList();
    }
    return [..._items];
  } // clone list, prevent modify list.

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showFavoriteAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  } */