import 'package:airfly/core/failure/failure.dart';
import 'package:airfly/features/auth/data/repository/auth_remote_repository.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:student_clean_arch/features/auth/data/repository/auth_local_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(UserEntity student);
  Future<Either<Failure, bool>> loginStudent(String username, String password);
}
