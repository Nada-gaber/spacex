import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/features/login/data/repo/login_repo.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';
import 'package:spacex/features/login/ui/login_screen.dart';

class LoginBlocProvider extends StatelessWidget {
  const LoginBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepo>()),
      child: const LoginScreen(),
    );
  }
}
