part of 'edit_profile_data_cubit.dart';

@immutable
abstract class EditProfileDataState {}

class EditProfileDataInitial extends EditProfileDataState {}

class EditProfileDataLoading extends EditProfileDataState {}

class EditProfileDataSuccess extends EditProfileDataState {}

class EditProfileDataFailure extends EditProfileDataState {
  final String errorMessage;

  EditProfileDataFailure(this.errorMessage);
}
