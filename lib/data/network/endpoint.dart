import 'package:ethio_duolingo/flavor.dart';

class Endpoint {
  // ignore: missing_return
  static String getBaseUrl() {
    switch (flavor) {
      case FlavorEnum.DEV:
        return "https://jsonplaceholder.typicode.com";
        break;
      case FlavorEnum.STAG:
        return "https://jsonplaceholder.typicode.com";
        break;
      case FlavorEnum.PROD:
        return "https://jsonplaceholder.typicode.com";
        break;
    }
  }

  static const String login = "/users/1";
  static const String posts = "/posts?userId=1";
}
