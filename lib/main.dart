import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_mate/constants.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/service_locator.dart';
import 'package:shop_mate/core/utils/simple_bloc_observer.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_all_categories_cubit/fetch_all_categories_cubit.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_products_cubit%20copy/fetch_products_cubit.dart';
import 'package:shop_mate/features/search/data/repo/search_repo_impl.dart';
import 'package:shop_mate/core/manager/add_product_cubit/add_product_cubit.dart';
import 'package:shop_mate/features/search/presentation/manager/fetch_searched_products_cubit%20copy/fetch_searched_products_cubit.dart';

import 'features/home/data/repo/home_repo_impl.dart';
import 'core/manager/delete_product_cubit/delete_product_cubit.dart';
import 'core/manager/fetch_all_products_cubit.dart/fetch_all_favorite_products_cubit.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(kProductsBox);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchViewsCubit(),
        ),
        BlocProvider(
          create: (context) => FetchAllCategoriesCubit(
            homeRepoImplement: getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchProductsCubit(
            homeRepoImplement: getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchSearchedProductsCubit(
            searchRepoImpl: getIt.get<SearchRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteProductCubit(),
        ),
        BlocProvider(
          create: (context) => FetchAllFavoriteProductsCubit(),
        ),
      ],
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.goRouter,
      ),
    );
  }
}
