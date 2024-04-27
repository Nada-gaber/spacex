part of 'upload_profile_image_cubit.dart';

@immutable
abstract class UploadProfileImageState {}

class UploadProfileImageInitial extends UploadProfileImageState {}

class UploadProfileImageLoading extends UploadProfileImageState {}

class UploadProfileImageSuccess extends UploadProfileImageState {
  final String imageUrl;

  UploadProfileImageSuccess(this.imageUrl);
}

class UploadProfileImageFailure extends UploadProfileImageState {
  final String errorMessage;

  UploadProfileImageFailure(this.errorMessage);
}
