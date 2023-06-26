import 'package:airfly/config/constants/api_endpoint.dart';
import 'package:airfly/core/network/remote/http_service.dart';
import 'package:airfly/core/shared_prefs/user_shared_preference.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

//To send the image that we uploaded in the profile to the server we need auth remote data source
final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

//The image is provided by authremotedatasource to the nodejs server
class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  AuthRemoteDataSource({required this.userSharedPrefs, required this.dio});

  //Register
  Future<Either<Failure, bool>> registerStudent(UserEntity user) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fname": user.fname,
          "lname": user.lname,
          "username": user.username,
          "password": user.password,
        },
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  //Login
  Future<Either<Failure, bool>> loginStudent(
      String username, String password) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        //retrive token
        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
