import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cep_search/src/bloc/cep_event.dart';
import 'package:cep_search/src/bloc/cep_sate.dart';
import 'package:cep_search/src/services/cep_service.dart';
import 'package:http/http.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final CepService service;

  CepBloc(this.service) : super(InitialState()) {
    on<CatchCep>(_catchCep);
  }

  Future<void> _catchCep(event, emit) async {
    final model = event.cep;
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 1));
    try {
      Response response;
      response = await service.getCEP(model);
      String jsonDataString = response.body.toString();
      final data = jsonDecode(jsonDataString);
      emit(SuccessState(data));
    } catch (e, s) {
      emit(ExceptionState(e.toString(), s));
    }
  }
}
