import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/login/logic/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading) {
          context.read<LoginCubit>().requestLoading = true;
        }else if(state is LoginSuccess) {
          // ToDo add toast
        }else if(state is LoginFailure) {
          // ToDo add toast
        }
        context.read<LoginCubit>().requestLoading = false;
      },
    );
  }
}
