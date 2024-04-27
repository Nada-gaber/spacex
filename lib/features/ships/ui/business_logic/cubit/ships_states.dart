import 'package:meta/meta.dart';
import '../../data/model/ships_model.dart';

@immutable
abstract class ShipsState {}

class ShipsInitial extends ShipsState {}

class ShipsLoading extends ShipsState {}

class ShipsLoaded extends ShipsState {
  final List<Ships> ships;

  ShipsLoaded(this.ships);
}

class ShipsError extends ShipsState {
  final String error;

  ShipsError(this.error);
}
