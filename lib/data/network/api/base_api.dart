import 'package:ethio_duolingo/enums/view_state.dart';
import 'package:ethio_duolingo/utils/dio/dio_exceptions.dart';
import 'package:flutter/foundation.dart';

class BaseApi extends ChangeNotifier {
  ViewState _state = ViewState.IDLE;
  String _errorMessage;
  dynamic _errorResponse;

  ViewState get state => _state;
  String get errorMessage => _errorMessage;
  dynamic get errorResponse => _errorResponse;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setError(DioExceptions error) {
    _errorMessage = error.message;
    _errorResponse = error.data;
  }
}
