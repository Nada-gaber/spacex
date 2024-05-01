import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spacex/features/home/data/models/user_model.dart';
import 'package:spacex/features/register/data/repo/register_repo.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final RegisterRepo registerRepo;

  CreateUserCubit(this.registerRepo) : super(CreateUserInitial());

  Future createUser(UserModel userModel) async {
    emit(CreateUserLoading());
    final result = await registerRepo.createUser(userModel);
    result.fold(
      (failure) => emit(CreateUserFailure(failure.message)),
      (unit) => emit(CreateUserSuccess()),
    );
  }
}
