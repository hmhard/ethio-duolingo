import 'package:ethio_duolingo/data/network/endpoint.dart';
import 'package:ethio_duolingo/data/network/provider_api/provider_api.dart';
import 'package:ethio_duolingo/utils/dio/response_api.dart';
import 'package:ethio_duolingo/utils/dio/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../locator.dart';

class AuthService {
  final _providerApi = locator<ProviderApi>();

  Future<ResponseApi> login(
      {@required String email, @required String password}) async {
    ResponseApi responseApi = ResponseApi();
    try {
      Response response = await _providerApi.dio.get(Endpoint.login);
      responseApi.setData(response.data);
    } on DioError catch (e) {
      responseApi.setError(getDioExceptions(e));
    }
    return responseApi;
  }
}
