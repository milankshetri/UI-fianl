import 'package:airfly/config/router/app_route.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:airfly/features/auth/domain/use_case/auth_usecase.dart';
import 'package:airfly/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerStudent(UserEntity student) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerStudent(student);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        error: null,
      ),
    );
  }

  Future<bool> loginStudent(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    bool isLogin = false;
    var data = await _authUseCase.loginStudent(username, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(
            message: 'Invalid credentials',
            context: context,
            color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(context, AppRoute.homeRoute);
      },
    );

    return isLogin;
  }
}
