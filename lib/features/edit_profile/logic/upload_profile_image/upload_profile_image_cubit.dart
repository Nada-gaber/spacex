import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spacex/features/edit_profile/data/profile_repo.dart';

part 'upload_profile_image_state.dart';

class UploadProfileImageCubit extends Cubit<UploadProfileImageState> {
  final ProfileRepo profileRepo;

  UploadProfileImageCubit(this.profileRepo)
      : super(UploadProfileImageInitial());

  File? file;
  String? imagePath;

  uploadProfileImage() async{
    emit(UploadProfileImageLoading());
    final response = await profileRepo.uploadProfileImage(file!, imagePath!);
    response.fold(
      (failure) => emit(UploadProfileImageFailure(failure.message)),
      (imageUrl) {
        emit(UploadProfileImageSuccess(imageUrl));
      },
    );
  }
}
