import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_class.dart';
import '../models/payment_input_intent_model.dart';

abstract class CheckoutRepo {
  Future<Either<FailureService, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
