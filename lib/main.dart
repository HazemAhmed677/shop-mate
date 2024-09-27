import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_mate/constants.dart';
import 'package:shop_mate/core/manager/add_to_cart_cubit/add_product_cubit.dart';
import 'package:shop_mate/core/manager/add_to_search_box_cubit/add_to_search_cubit.dart';
import 'package:shop_mate/core/manager/delete_from_cart_cubit/delete_product_cubit.dart';
import 'package:shop_mate/core/manager/delete_from_search_box_cubit/delete_from_search_cubit.dart';
import 'package:shop_mate/core/manager/fetch_cart_cubit.dart/fetch_cart_products_cubit.dart';
import 'package:shop_mate/core/manager/fetch_search_box_cubit.dart/fetch_search_box_cubit.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/service_locator.dart';
import 'package:shop_mate/core/utils/simple_bloc_observer.dart';
import 'package:shop_mate/features/authentication/presentation/manager/sign_in_with_email_cubit/sign_in_with_email_cubit.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_all_categories_cubit/fetch_all_categories_cubit.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_products_cubit%20copy/fetch_products_cubit.dart';
import 'package:shop_mate/features/search/data/repo/search_repo_impl.dart';
import 'package:shop_mate/core/manager/add_to_favorites_cubit/add_product_cubit.dart';
import 'package:shop_mate/features/search/presentation/manager/fetch_searched_products_cubit%20copy/fetch_searched_products_cubit.dart';
import 'package:shop_mate/firebase_options.dart';
import 'features/authentication/presentation/manager/sign_in_with_google_cubit copy/sign_in_with_google_cubit.dart';
import 'features/authentication/presentation/manager/sign_up_with_email_cubit/sign_up_with_email_cubit.dart';
import 'features/home/data/repo/home_repo_impl.dart';
import 'core/manager/delete_from_favorites_cubit/delete_product_cubit.dart';
import 'core/manager/fetch_favorites_cubit.dart/fetch_all_favorite_products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(
    ProductModelAdapter(),
  );
  await Hive.openBox<ProductModel>(kFavoritesBox);
  await Hive.openBox<ProductModel>(kCartBox);
  await Hive.openBox<String>(kSearchedProductsBox);
  Stripe.publishableKey = kPublishableKey;
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
          create: (context) => AddToFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFromFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => FetchAllFavoriteProductsCubit(),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFromCartCubit(),
        ),
        BlocProvider(
          create: (context) => FetchCartProductsCubit(),
        ),
        BlocProvider(
          create: (context) => AddToSearchCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFromSearchCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSearchBoxCubit(),
        ),
        BlocProvider(
          create: (context) => SignInWithEmailCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpWithEmailCubit(),
        ),
        BlocProvider(
          create: (context) => SignInWithGoogleCubit(),
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
