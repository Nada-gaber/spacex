import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/features/register/logic/register_cubit.dart';
import 'package:spacex/features/register/ui/register_screen.dart';

class RegisterBlocProvider extends StatelessWidget {
  const RegisterBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: const RegisterScreen(),
    );
  }
}
