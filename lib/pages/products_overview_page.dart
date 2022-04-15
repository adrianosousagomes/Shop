import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/product_grid.dart';
import '../models/product_list.dart';

enum FilterOptions { FAVORITO, ALL }

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.FAVORITO,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.ALL,
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.FAVORITO) {
                provider.showFavoriteOnly();
              } else {
                provider.showFavoriteAll();
              }
            },
          )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
