part of 'get_all_crew_cubit.dart';

@immutable
abstract class GetAllCrewState {}

class GetAllCrewInitial extends GetAllCrewState {}

class GetAllCrewLoading extends GetAllCrewState {}

class GetAllCrewSuccess extends GetAllCrewState {
  final List<CrewModel> crews;

  GetAllCrewSuccess(this.crews);
}

class GetAllCrewFailure extends GetAllCrewState {
  final String errorMessage;

  GetAllCrewFailure(this.errorMessage);
}
