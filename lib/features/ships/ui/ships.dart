import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import 'package:spacex/core/constant/images.dart';
import '../../../core/networking/web_services.dart';
import 'business_logic/cubit/ships_cubit.dart';
import 'business_logic/cubit/ships_states.dart';
import 'data/repo/ships_repo.dart';
import 'widgets/ship_container.dart';
import 'widgets/ship_search.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  final cubit = ShipsCubit(ShipsRepository(WebServices(Dio())));
  bool _isSearchBarActive = false;
  String _searchTerm = '';

  void _handleSearchClick() {
    setState(() {
      _isSearchBarActive = !_isSearchBarActive;
      if (!_isSearchBarActive) {
        _searchTerm = '';
        cubit.fetchShips(); // Fetch all ships again on deactivation
      }
    });
  }

  void _handleSearchChange(String value) {
    setState(() {
      _searchTerm = value;
      cubit.fetchShips(searchTerm: _searchTerm); // Might not be needed here
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        cubit.fetchShips();
        return cubit;
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: _isSearchBarActive
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Ships...',
                  ),
                  onChanged: _handleSearchChange,
                )
              : const Text('SpaceX Ships'),
          actions: [
            IconButton(
              icon: Icon(_isSearchBarActive ? Icons.close : Icons.search),
              onPressed: _handleSearchClick,
            ),
          ],
        ),
        body: BlocBuilder<ShipsCubit, ShipsState>(
          builder: (context, state) {
            if (state is ShipsInitial) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.blueGrey,
                ),
              );
            } else if (state is ShipsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.buttonColor,
                ),
              );
            } else if (state is ShipsLoaded) {
              final ships = state.ships;
              final filteredShips = ShipSearch.filterShips(ships, _searchTerm);
              return ListView.builder(
                itemCount: filteredShips.length,
                itemBuilder: (context, index) {
                  final ship = filteredShips[index];
                  return shipContainer(
                    context,
                    ship.image ?? MyImages.imageNotFound,
                    ship.name ?? 'No Name',
                    ship.yearBuilt ?? 00,
                    ship.massKg ?? 00,
                    ship.type ?? 'Not Definded',
                  );
                },
              );
            } else if (state is ShipsError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Text(
                'Unexpected state: $state',
              );
            }
          },
        ),
      ),
    );
  }
}
