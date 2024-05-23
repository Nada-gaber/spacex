import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spacex/features/home/data/repo/home_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final HomeRepo homeRepo;

  LogoutCubit(this.homeRepo) : super(LogoutInitial());

  Future logout() async {
    emit(LogoutLoading());
    final result = await homeRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (unit) => emit(LogoutSuccess()),
    );
  }
}
