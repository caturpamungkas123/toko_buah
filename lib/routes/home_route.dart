import 'package:flutter/material.dart';
import 'package:toko_buah/page/home/main_home_page.dart';
import 'package:toko_buah/page/home/product/product_detail.dart';

Route<dynamic> homeRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => MainHomePage());
    case '/product-detail':
      final args = settings.arguments as Map;

      return MaterialPageRoute(
        builder: (_) => ProductDetail(imgPath: args["imgPath"]),
      );
    default:
      return MaterialPageRoute(
        builder:
            (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
