import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex/features/home/data/repo/rocket_repo.dart';

import '../../../data/models/rocket_model.dart';

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit(this.rocketRepo) : super(RocketInitial());

  final RocketRepo rocketRepo;

  void getAllRockets() async {
    emit(GetAllRocketsLoading());
    var response = await rocketRepo.getAllRockets();

    response.fold((failure) {
      emit(GetAllRocketsFailure(failure.message));
    }, (rockets) {
      emit(GetAllRocketsSuccess(rockets));
    });
  }
}
