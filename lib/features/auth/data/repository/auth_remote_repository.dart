import 'package:airfly/core/failure/failure.dart';
import 'package:airfly/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:airfly/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRespository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRespository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRespository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> registerStudent(UserEntity user) {
    return _authRemoteDataSource.registerStudent(user);
  }

  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    return _authRemoteDataSource.loginStudent(username, password);
  }
}
