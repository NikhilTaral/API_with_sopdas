import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentMethodSelected extends PaymentEvent {
  final String paymentMethod;

  const PaymentMethodSelected(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}
