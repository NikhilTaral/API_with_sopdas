import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class SelectTimeSlot extends AppointmentEvent {
  final String selectedSlot;

  const SelectTimeSlot(this.selectedSlot);

  @override
  List<Object> get props => [selectedSlot];
}
