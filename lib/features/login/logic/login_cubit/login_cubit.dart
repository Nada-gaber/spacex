import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/login/data/models/login_request_model.dart';
import 'package:spacex/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login() async {
    emit(LoginLoading());
    final response = await loginRepo.login(LoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userCredential) => emit(LoginSuccess(userCredential.user!.uid)),
    );
  }
}
