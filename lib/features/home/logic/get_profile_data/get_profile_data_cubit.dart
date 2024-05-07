import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/features/home/data/models/user_model.dart';
import 'package:spacex/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  final HomeRepo homeRepo;

  GetProfileDataCubit(this.homeRepo) : super(GetProfileDataInitial());

  Future getProfileData() async {
    print('hello');
    emit(GetProfileDataLoading());

    final response = await homeRepo.getProfileData(MyStrings.token);

    response.fold(
      (failure) => emit(GetProfileDataFailure(failure.message)),
      (userModel) => emit(GetProfileDataSuccess(userModel)),
    );
  }
}
