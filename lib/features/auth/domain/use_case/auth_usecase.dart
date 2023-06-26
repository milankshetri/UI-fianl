import 'package:airfly/core/failure/failure.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:airfly/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(
    ref.read(authRepositoryProvider),
  );
});

class AuthUseCase {
  final IAuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerStudent(UserEntity user) async {
    return await _authRepository.registerStudent(user);
  }

  Future<Either<Failure, bool>> loginStudent(
      String username, String password) async {
    return await _authRepository.loginStudent(username, password);
  }
}
