import 'package:bloc/bloc.dart';

import '../../../data/models/payment_input_intent_model.dart';
import '../../../data/repos/checkout_repo_impl.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit() : super(StripeInitial());
  CheckoutRepoImpl checkoutRepoImpl = CheckoutRepoImpl();

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripeLoading());
    var result = await checkoutRepoImpl.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
      (left) => emit(
        StripeFailure(errorMsg: 'Payment Cancelled'),
      ),
      (right) => emit(
        StripeSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<StripeState> change) {
    super.onChange(change);
    print(change);
  }
}
