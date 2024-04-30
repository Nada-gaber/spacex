import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex/features/home/data/models/launch_pad_model.dart';
import 'package:spacex/features/home/data/repo/launch_pad_repo.dart';

part 'launch_pads_state.dart';

class LaunchPadsCubit extends Cubit<LaunchPadsState> {
  LaunchPadsCubit(this.launchPadRepo) : super(LaunchPadsInitial());

  final LaunchPadRepo launchPadRepo;

  void getAllLaunchPads() async {
    emit(LaunchPadsLoading());
    var response = await launchPadRepo.getAllLaunchPads();

    response.fold((failure) {
      emit(LaunchPadsLoadedFailure(failure.message));
    }, (launchPads) {
      emit(LaunchPadsLoadedSuccess(launchPads));
    });
  }
}
