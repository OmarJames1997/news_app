import 'package:dio/dio.dart';


class DioHelper {

  // declaring The Dio
  static late Dio dio;

  //  A Method That Should be called in the Main before Running the App
  static void init() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: "https://newsapi.org/v2/", receiveDataWhenStatusError: true);

    dio = Dio(baseOptions);
  }

  Future get({required String path, Map<String, dynamic>? params}) async {
    return await dio.get(
      path,
      queryParameters: params,
    );
  }

  Future getData({required String path, Map<String, dynamic>? params}) async {
    return await dio.get(
      path,
      queryParameters: params,
    );
  }

}
