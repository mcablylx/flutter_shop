import 'package:dio/dio.dart';
import 'package:shop/config/service_url.dart';

Future request(String apiUrl, {var formData}) async {
  try {
    print("调用服务器");
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    if (formData == null)
      response = await dio.post(servicePath[apiUrl]);
    else
      response = await dio.post(servicePath[apiUrl], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print("ERROR:======> $e");
  }
}

Future getHomeContent() async {
  try {
    print("调用服务器");
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print("ERROR:======> $e");
  }
}

Future getHomePageBelowContent() async {
  try {
    print("调用服务器");
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    int page = 1;
    response = await dio.post(servicePath[homePageBelowConten], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print("ERROR:======> $e");
  }
}
