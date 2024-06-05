import 'package:equatable/equatable.dart';

abstract class PatientRecordState extends Equatable {
  const PatientRecordState();

  @override
  List<Object> get props => [];
}

class PatientRecordInitial extends PatientRecordState {}

class PatientRecordLoaded extends PatientRecordState {
  final String patientName;
  final String patientAge;
  final String issueDescription;
  // Add other necessary fields

  const PatientRecordLoaded({
    required this.patientName,
    required this.patientAge,
    required this.issueDescription,
  });

  @override
  List<Object> get props => [patientName, patientAge, issueDescription];
}

class PatientRecordError extends PatientRecordState {
  final String message;

  const PatientRecordError(this.message);

  @override
  List<Object> get props => [message];
}
