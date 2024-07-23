import 'package:ethio_duolingo/data/local/sqlite.dart';
import 'package:ethio_duolingo/data/network/api/base_api.dart';
import 'package:ethio_duolingo/utils/dio/response_api.dart';
import 'package:ethio_duolingo/data/network/service/auth_service.dart';
import 'package:ethio_duolingo/enums/view_state.dart';
import 'package:ethio_duolingo/locator.dart';
import 'package:ethio_duolingo/models/user.dart';
import 'package:flutter/foundation.dart';

class LoginApi extends BaseApi {
  AuthService _authService = locator<AuthService>();
  Sqlite _sqlite = locator<Sqlite>();

  User user;

  Future login({@required String email, @required String password}) async {
    setState(ViewState.BUSY);
    ResponseApi responseApi =
        await _authService.login(email: email, password: password);

    if (responseApi.data != null) {
      user = User.fromJson(responseApi.data);
      //add to stream
      _sqlite.addUserStreamController(user);
      //insert to local
      await _sqlite.insertUser(user);
    } else {
      setError(responseApi.error);
    }
    setState(ViewState.IDLE);
  }
}
