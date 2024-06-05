import 'package:bloc/bloc.dart';
import 'package:project/paitent_Detils/presentation/bloc/paitent_event.dart';
import 'package:project/paitent_Detils/presentation/bloc/paitent_state.dart';




class PatientRecordBloc extends Bloc<PatientRecordEvent, PatientRecordState> {
  PatientRecordBloc() : super(PatientRecordInitial()) {
    on<LoadPatientRecord>(_onLoadPatientRecord);
  }

  void _onLoadPatientRecord(
    LoadPatientRecord event,
    Emitter<PatientRecordState> emit,
  ) {
    // Simulate data loading
    try {
      emit(PatientRecordLoaded(
        patientName: 'John Doe',
        patientAge: '30 years',
        issueDescription: 'Lorem ipsum dolor sit amet...',
      ));
    } catch (e) {
      emit(PatientRecordError('Failed to load patient record'));
    }
  }
}
