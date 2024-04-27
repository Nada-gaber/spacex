import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spacex/features/edit_profile/data/profile_repo.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

part 'edit_profile_data_state.dart';

class EditProfileDataCubit extends Cubit<EditProfileDataState> {
  final ProfileRepo profileRepo;

  EditProfileDataCubit(this.profileRepo) : super(EditProfileDataInitial());

  TextEditingController nameController = TextEditingController();
  String profileImageUrl = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future editProfileData(UserModel userModel) async {
    emit(EditProfileDataLoading());
    final response = await profileRepo.editProfileData(userModel);
    response.fold(
      (failure) => emit(EditProfileDataFailure(failure.message)),
      (unit) => emit(EditProfileDataSuccess()),
    );
  }
}
