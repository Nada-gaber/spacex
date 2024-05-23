part of 'create_user_cubit.dart';

@immutable
abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {}

class CreateUserFailure extends CreateUserState {
  final String errorMessage;

  CreateUserFailure(this.errorMessage);
}
