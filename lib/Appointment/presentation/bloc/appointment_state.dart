import 'package:equatable/equatable.dart';

class AppointmentState extends Equatable {
  final String? selectedSlot;

  const AppointmentState({this.selectedSlot});

  @override
  List<Object?> get props => [selectedSlot];

  AppointmentState copyWith({String? selectedSlot}) {
    return AppointmentState(
      selectedSlot: selectedSlot ?? this.selectedSlot,
    );
  }
}
