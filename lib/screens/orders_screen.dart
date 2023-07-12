import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appdrawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: ordersdata.orders.length,
          itemBuilder: (ctx, i) => OrderItem(ordersdata.orders[i])),
    );
  }
}
