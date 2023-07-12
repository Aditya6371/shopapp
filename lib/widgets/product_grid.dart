import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './productsitem.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  const ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = showFavs ? productsdata.favoriteItems : productsdata.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int i) =>
          ChangeNotifierProvider.value(
        // create: (BuildContext context) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
    );
  }
}
