import '../data/model/ships_model.dart';

class ShipSearch {
  static List<Ships> filterShips(List<Ships> ships, String searchTerm) {
    return searchTerm.isEmpty
        ? ships
        : ships.where((ship) => ship.name?.toLowerCase().contains(searchTerm.toLowerCase()) ?? false).toList();
  }
}


