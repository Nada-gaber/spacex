part of 'get_profile_data_cubit.dart';

@immutable
abstract class GetProfileDataState {}

class GetProfileDataInitial extends GetProfileDataState {}

class GetProfileDataLoading extends GetProfileDataState {}

class GetProfileDataSuccess extends GetProfileDataState {
  final UserModel userModel;

  GetProfileDataSuccess(this.userModel);
}

class GetProfileDataFailure extends GetProfileDataState {
  final String errorMessage;

  GetProfileDataFailure(this.errorMessage);
}
