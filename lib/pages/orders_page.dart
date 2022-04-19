import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';

import '../components/order.dart';
import '../models/order_list.dart';

class OrdersPage extends StatelessWidget {

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: Provider.of<OrderList>(context, listen: false).loadOrders(),
          builder: (ctx, snapshop) {
            if (snapshop.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshop.error != null) {
              return Center(child: Text('Ocorreu um erro!'));
            } else {
              return Consumer<OrderList>(
                builder: (ctx, orders, child) => ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
                ),
              );
            }
          }),
      // body: RefreshIndicator(
      //   onRefresh: () => _refreshOrders(context),
      //   child: _isLoading
      //       ? Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : ListView.builder(
      //           itemCount: orders.itemsCount,
      //           itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
      //         ),
      // ),
    );
  }
}
