// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class RestApiBaseService {
  Dio dio = Dio();

  // RestApiBaseService() {
  //   BaseOptions options = BaseOptions(
  //     baseUrl: /*Constants.baseUrl + "8008/"*/ ApiUrls.customer,
  //     connectTimeout: 30000,
  //     receiveTimeout: 30000,
  //   );
  //   dio = Dio(options);
  // }
}
