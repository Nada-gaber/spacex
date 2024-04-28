part of 'rocket_cubit.dart';

@immutable
abstract class RocketState {}

class RocketInitial extends RocketState {}

class GetAllRocketsLoading extends RocketState {}

class GetAllRocketsSuccess extends RocketState {
  final List<Rocket> allRockets;

  GetAllRocketsSuccess(this.allRockets);
}

class GetAllRocketsFailure extends RocketState {
  final String errorMessage;

  GetAllRocketsFailure(this.errorMessage);
}


