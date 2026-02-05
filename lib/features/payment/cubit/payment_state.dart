abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String method;

  PaymentMethodSelected(this.method);
}

class PaymentSuccess extends PaymentState {}
