import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:souq_mazad/core/network/api_error_handler.dart';
import 'package:souq_mazad/core/network/api_error_model.dart';
import 'package:souq_mazad/core/network/api_services.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';

class ProductRepo {
  final ApiServices apiServices;

  ProductRepo(this.apiServices);
  Future<Either<ErrorModel, ProductModel>> getAllProduct(
      {required int limit, required int skip}) async {
    try {
      final response =
          await apiServices.getAllProduct(limit: limit, skip: skip);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }
}
