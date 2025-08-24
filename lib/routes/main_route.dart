import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_buah/bloc/auth/auth_bloc.dart';
import 'package:toko_buah/page/auth/login_page.dart';
import 'package:toko_buah/page/auth/register_page.dart';
import 'package:toko_buah/page/home/explore/explore_detail.dart';
import 'package:toko_buah/page/home/main_home_page.dart';
import 'package:toko_buah/page/home/product/product_detail.dart';
import 'package:toko_buah/page/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashPage());
    case '/login':
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => AuthLoginBloc(),
              child: LoginPage(),
            ),
      );
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => MainHomePage());
    case '/product-detail':
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => ProductDetail(imgPath: args["imgPath"]),
      );
    case '/explore-detail':
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => ExploreDetail(title: args["title"]),
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
