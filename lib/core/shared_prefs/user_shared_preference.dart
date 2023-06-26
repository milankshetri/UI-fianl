import 'package:airfly/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userSharedPrefsProvider = Provider((ref) => UserSharedPrefs());

class UserSharedPrefs {
  late SharedPreferences sharedPreferences;

  //Set User Token
  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("token", token);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  //Get User Token
  Future<Either<Failure, String?>> getUserToken() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString("token");
      return right(token);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
