import 'package:dartz/dartz.dart';
import 'package:shop_mate/features/cart/data/repos/checkout_repo.dart';

import '../../../../core/errors/failure_class.dart';
import '../../../../core/utils/stripe_service.dart';
import '../models/payment_input_intent_model.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  @override
  Future<Either<FailureService, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await StripeService().makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(
        null,
      );
    } catch (e) {
      return left(
        FailureService(
          e.toString(),
        ),
      );
    }
  }
}
