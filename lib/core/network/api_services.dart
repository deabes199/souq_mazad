import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:souq_mazad/core/network/api_constant.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstant.baseURL)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET(ApiConstant.allProducts)
  Future<ProductModel> getAllProduct({
    @Query('limit') int limit=10,
    @Query('skip') int skip=0
  });

}
