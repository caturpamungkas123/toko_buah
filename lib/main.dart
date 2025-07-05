import 'package:flutter/material.dart';
import 'package:toko_buah/routes/main_route.dart';
import 'package:toko_buah/routes/navigator_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
