import 'dart:convert';
import 'dart:io';

class HttpRequestManager {
  static Future<String?> registerToAppServer({
    required String username,
    required String password,
  }) async {
    var httpClient = HttpClient();
    var uri = Uri.http("a41.easemob.com", "/app/chat/user/register");

    var request = await httpClient.postUrl(uri);
    request.write({
      "userAccount": username,
      "userPassword": password,
    });
    HttpClientResponse response = await request.close();
    httpClient.close();
    if (response.statusCode == HttpStatus.ok) {
      var _content = await response.transform(const Utf8Decoder()).join();
      return _content;
    }
    return null;
  }
}
