import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/ships_repo.dart';
import 'ships_states.dart';

class ShipsCubit extends Cubit<ShipsState> {
  final ShipsRepository _shipRepository;

  ShipsCubit(this._shipRepository) : super(ShipsInitial());

  Future fetchShips({String searchTerm = ''}) async {
    emit(ShipsLoading());
    final result = await _shipRepository.getShips();
    result.fold(
      (failure) => emit(ShipsError(failure.message)),
      (ships) => emit(ShipsLoaded(ships)),
    );
  }
}
