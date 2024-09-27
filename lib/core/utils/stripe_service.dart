import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shop_mate/core/utils/api_class.dart';

import '../../constants.dart';
import '../../features/cart/data/models/payment_input_intent_model.dart';
import '../../features/cart/data/models/payment_intent_model/payment_intent.dart';

class StripeService {
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await ApiClass().post(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: kMyToken);
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'HZM',
        paymentIntentClientSecret: clientSecret,
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(clientSecret: paymentIntentModel.clientSecret!);
    await presentPaymentSheet();
  }
}
