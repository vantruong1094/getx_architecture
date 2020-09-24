
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:get/get.dart';
import 'package:getx_demo/configs/app_configs.dart';
import 'package:getx_demo/data/helper/network_checker.dart';
import 'package:getx_demo/data/services/end_point_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helper/app_exception.dart';
import '../helper/resource.dart';

class BaseService {
  Dio _dio;

  BaseService() {
    _dio = _buildDio();
  }

  Dio _buildDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Get.find<AppConfigs>().apiBaseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );

    final dio = Dio(options)
      ..transformer = FlutterTransformer()
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options) async {
          options.queryParameters["api_key"] = "0eb50693b92ff2faecefe9dd7135c388";
//          final accessToken = await Prefs.accessToken;
//          options.headers['Content-Type'] = 'application/json; charset=utf-8';
//          options.headers['Accept'] = 'application/json';
//          options.headers['User-Agent'] = Constants.USER_AGENT;
//
//          if (accessToken.isNotEmpty) {
//            options.headers.remove(Constants.AUTHORIZATION_TOKEN);
//            options.headers[Constants.AUTHORIZATION_TOKEN] = accessToken;
//          }
        }),
      )
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          request: true,
          maxWidth: 200,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true));
    return dio;
  }

  Future<Resource<Response>> sendRequest(EndPointApp endPoint,
      {Map<String, dynamic> params}) async {
    bool isConnected = await NetworkChecker.check();
    if (!isConnected) {
      return Resource.error(NoNetworkException());
    }
    if (endPoint.method == MethodRequest.GET) {
      try {
        final response = await get(endPoint.path, params);
        if (response.statusCode >= 200 && response.statusCode < 299) {
          return Resource.success(response);
        } else {
          print("error response: ${response}");
          return Resource.error(NoNetworkException());
        }
      } catch (e) {
        print("error exception: ${e}");
        return Resource.error(handleError(e));
      }
    }
    return Resource.empty();
  }

  ///used for calling Get Request
  Future<Response> get(String url, Map<String, String> params) async {
    Response response = await _dio.get(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json));
    return response;
  }

  ///used for calling post Request
  Future<Response> post(String url, Map<String, String> params) async {
    Response response = await _dio.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}
