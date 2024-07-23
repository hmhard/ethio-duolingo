import 'package:ethio_duolingo/data/network/endpoint.dart';
import 'package:ethio_duolingo/data/network/provider_api/provider_api.dart';
import 'package:ethio_duolingo/utils/dio/response_api.dart';
import 'package:ethio_duolingo/locator.dart';
import 'package:ethio_duolingo/utils/dio/dio_exceptions.dart';
import 'package:dio/dio.dart';

class PostsService {
  ProviderApi _providerApi = locator<ProviderApi>();

  Future<ResponseApi> getPosts() async {
    ResponseApi responseApi = ResponseApi();
    try {
      Response response = await _providerApi.dio.get(Endpoint.posts);
      responseApi.setData(response.data);
    } on DioError catch (e) {
      responseApi.setError(getDioExceptions(e));
    }
    return responseApi;
  }
}
