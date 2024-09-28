import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/core/widgets/checkout_loading.dart';
import 'package:shop_mate/core/widgets/show_snack_bar.dart';
import '../../features/cart/data/models/payment_input_intent_model.dart';
import '../../features/cart/presentation/manager/stripe_cubit/stripe_cubit.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {
        if (state is StripeSuccess) {
          context.push(AppRouters.thankYou, extra: product);
        } else if (state is StripeFailure) {
          showSnackBar(
            context: context,
            e: state.errorMsg,
            delay: 1000,
          );
        }
      },
      builder: (context, state) {
        return (state is StripeLoading)
            ? const LoadingCheckout()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  overlayColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 52,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  // present stripe sheet here
                  await triggerStripeGateWay(context);
                },
                child: Text(
                  'Checkout',
                  style: AppStyles.regular24(context).copyWith(
                    color: AppColors.white,
                    fontSize: getResponsiveText(context: context, base: 24),
                  ),
                ),
              );
      },
    );
  }

  Future<void> triggerStripeGateWay(BuildContext context) async {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: product.price.toString(),
      currency: 'USD',
    );
    await BlocProvider.of<StripeCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }
}
