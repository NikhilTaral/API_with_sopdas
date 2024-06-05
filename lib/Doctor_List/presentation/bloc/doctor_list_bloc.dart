import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_event.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<FetchApiData>(_onFetchApiData);
  }

  Future<void> _onFetchApiData(
      FetchApiData event, Emitter<ApiState> emit) async {
    emit(ApiLoading());
    try {
      final response = await http
          .get(Uri.parse('https://nikhiltaral.github.io/data/data.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final ApiModel apiModel = ApiModel.fromJson(data);
        emit(ApiLoaded(apiModel: apiModel));
      } else {
        emit(ApiError(message: 'Failed to load data'));
      }
    } catch (e) {
      emit(ApiError(message: e.toString()));
    }
  }
}