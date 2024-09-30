import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../Constant/Api_Constant.dart';
import '../models/radio.dart';
import '../models/radio_models.dart';

class ApiService {
  static final Dio _dio = Dio(

      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
      )
  );

  static Future<Either<Exception, List<RadioModel>>> getRadio() async {
    try {
      var response = await _dio.get(EndPoints.radios);
      var radios = RadioListModel.fromJson(response.data).radios ?? [];
      return Right(radios);
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }
}