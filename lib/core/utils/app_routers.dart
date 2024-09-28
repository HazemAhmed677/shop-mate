import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/models/wrapper_product_model.dart';
import 'package:shop_mate/core/widgets/custom_fade_transition.dart';
import 'package:shop_mate/core/widgets/custom_slider_transition.dart';
import 'package:shop_mate/core/widgets/custom_zooming_transition.dart';
import 'package:shop_mate/features/authentication/presentation/views/sign_in_view.dart';
import 'package:shop_mate/features/authentication/presentation/views/sign_up_view.dart';
import 'package:shop_mate/features/cart/presentation/views/thank_you_view.dart';
import 'package:shop_mate/features/home/presentation/views/home_view.dart';
import 'package:shop_mate/core/views/product_details_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/streaming_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/welcome_view.dart';
import '../../features/authentication/presentation/manager/sign_up_with_email_cubit/sign_up_with_email_cubit.dart';

abstract class AppRouters {
  static const streaming = '/';
  static const welcome = '/welcome';
  static const home = '/triggerSwitch';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const onBoarding = '/onBoarding';
  static const productDetails = '/productDetails';
  static const thankYou = '/thankYou';

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: streaming,
        builder: (context, state) => const StreamingView(),
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
          duration: 400,
        ),
      ),
      GoRoute(
        path: signUp,
        pageBuilder: (context, state) => CustomFadeTransition(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => SignUpWithEmailCubit(),
            child: const SignUpView(),
          ),
          duration: 400,
        ),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: productDetails,
        pageBuilder: (context, state) => CustomZoomingTransition(
          key: state.pageKey,
          child: ProductDetailsView(
            wrapperProductModel: state.extra as WrapperProductModel,
          ),
          duration: 300,
        ),
      ),
      GoRoute(
        path: thankYou,
        pageBuilder: (context, state) => CustomZoomingTransition(
          key: state.pageKey,
          child: ThankYouView(
            productModel: state.extra as ProductModel,
          ),
          duration: 400,
        ),
      ),
    ],
  );
}
