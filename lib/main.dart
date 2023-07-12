import 'package:flutter/material.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/product_details_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/orders_screen.dart';
import './providers/orders.dart';
import 'package:provider/provider.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      // value: Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          hintColor: Colors.amberAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("MyShop"),
//       ),
//       body: const Center(
//         child: Text("PRODUCTS LIST...."),
//       ),
//     );
//   }
// }
