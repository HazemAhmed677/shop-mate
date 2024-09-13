import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_routers.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ShopMateApp(),
    ),
  );
}

class ShopMateApp extends StatelessWidget {
  const ShopMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.goRouter,
    );
  }
}
