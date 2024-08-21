import 'package:go_router/go_router.dart';
import 'package:shop_mate/features/splash/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String onBoarding = '/onBoarding';
  static const String productDetails = '/productDetails';

  static final GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
  ]);
}
