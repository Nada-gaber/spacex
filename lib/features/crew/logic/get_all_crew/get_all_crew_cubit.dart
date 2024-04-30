import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/crew/data/models/crew_model.dart';
import 'package:flutter/material.dart';
import 'package:spacex/features/crew/data/repo/crew_repo.dart';

part 'get_all_crew_state.dart';

class GetAllCrewCubit extends Cubit<GetAllCrewState> {
  final CrewRepo crewRepo;

  GetAllCrewCubit(this.crewRepo) : super(GetAllCrewInitial());

  Future getAllCrew() async {
    emit(GetAllCrewLoading());
    final result = await crewRepo.getAllCrew();
    result.fold(
      (failure) => emit(GetAllCrewFailure(failure.message)),
      (crews) => emit(GetAllCrewSuccess(crews)),
    );
  }
}
