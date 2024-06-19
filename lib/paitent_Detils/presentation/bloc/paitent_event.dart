import 'package:equatable/equatable.dart';

abstract class PatientRecordEvent extends Equatable {
  const PatientRecordEvent();

  @override
  List<Object> get props => [];
}

class LoadPatientRecord extends PatientRecordEvent {}
