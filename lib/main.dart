import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_routers.dart';

void main() {
  runApp(const ShopMateApp());
}

class ShopMateApp extends StatelessWidget {
  const ShopMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.goRouter,
    );
  }
}
