import 'package:spacex/features/home/data/models/user_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel userModel;

  RegisterSuccess(this.userModel);
}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}
