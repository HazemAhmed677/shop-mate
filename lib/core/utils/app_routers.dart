import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/widgets/custom_fade_transition.dart';
import 'package:shop_mate/core/widgets/custom_slider_transition.dart';
import 'package:shop_mate/core/widgets/custom_zooming_transition.dart';
import 'package:shop_mate/features/authentication/presentation/views/sign_in_view.dart';
import 'package:shop_mate/features/authentication/presentation/views/sign_up_view.dart';
import 'package:shop_mate/features/home/presentation/views/home_view.dart';
import 'package:shop_mate/features/home/presentation/views/product_details_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/welcome_view.dart';
import 'package:shop_mate/features/splash/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String onBoarding = '/onBoarding';
  static const String productDetails = '/productDetails';

  static final GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: welcome,
      pageBuilder: (context, state) => CustomZoomingTransition(
        key: state.pageKey,
        child: const WelcomeView(),
        duration: 800,
      ),
    ),
    GoRoute(
      path: onBoarding,
      pageBuilder: (context, state) => CustomSliderTransition(
        key: state.pageKey,
        child: const OnboardingView(),
        duration: 400,
      ),
    ),
    GoRoute(
      path: signIn,
      pageBuilder: (context, state) => CustomFadeTransition(
        key: state.pageKey,
        child: const SignInView(),
        duration: 200,
      ),
    ),
    GoRoute(
      path: signUp,
      pageBuilder: (context, state) => CustomFadeTransition(
        key: state.pageKey,
        child: const SignUpView(),
        duration: 400,
      ),
    ),
    GoRoute(
      path: home,
      pageBuilder: (context, state) => CustomFadeTransition(
        key: state.pageKey,
        child: const HomeView(),
        duration: 300,
      ),
    ),
    GoRoute(
      path: productDetails,
      pageBuilder: (context, state) => CustomZoomingTransition(
        key: state.pageKey,
        child: const ProductDetailsView(),
        duration: 300,
      ),
    ),
  ]);
}
