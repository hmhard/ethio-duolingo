import 'package:ethio_duolingo/utils/dio/dio_exceptions.dart';

class ResponseApi {
  dynamic data;
  DioExceptions error;

  void setData(dynamic newValue) {
    data = newValue;
  }

  void setError(DioExceptions newValue) {
    error = newValue;
  }
}
