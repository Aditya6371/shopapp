import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final String title;
  // ProductDetailsScreen(this.title);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedproducts = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(loadedproducts.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedproducts.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Rs: ${loadedproducts.price}",
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            loadedproducts.description,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
