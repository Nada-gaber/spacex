import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/register/data/models/register_request_model.dart';
import 'package:spacex/features/register/data/repo/register_repo.dart';
import 'package:spacex/features/register/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future register() async {
    emit(RegisterLoading());
    final response = await registerRepo.register(
      RegisterRequestModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (userModel) => emit(RegisterSuccess(userModel)),
    );
  }
}
