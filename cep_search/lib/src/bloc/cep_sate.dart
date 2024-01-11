abstract class CepState {}

class InitialState extends CepState {}

class LoadingState extends CepState {}

class ExceptionState extends CepState {
  final String message;
  final StackTrace? stackTrace;
  ExceptionState(this.message, this.stackTrace);
}

class SuccessState extends CepState {
  final Map<String, dynamic> map;
  SuccessState(this.map);
}
