import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../../features/cart/data/models/payment_input_intent_model.dart';
import '../../features/cart/presentation/manager/stripe_cubit/stripe_cubit.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            overlayColor: AppColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 52,
              vertical: 20,
            ),
            backgroundColor: Colors.green,
          ),
          onPressed: () async {
            // present stripe sheet here
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: product.price.toString(),
              currency: 'USD',
            );
            await BlocProvider.of<StripeCubit>(context).makePayment(
              paymentIntentInputModel: paymentIntentInputModel,
            );
          },
          child: Text(
            'Checkout',
            style: AppStyles.regular24(context).copyWith(
              color: AppColors.white,
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }
}
