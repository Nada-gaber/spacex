import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/strings.dart';
import 'package:spacex/core/functions/show_toast.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/utils/shared_preferences.dart';
import 'package:spacex/features/home/logic/logout/logout_cubit.dart';
import 'package:spacex/features/profile/ui/widgets/profile_component.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          MyStrings.token = '';
          MySharedPreferences.delete('token');
          MySharedPreferences.delete('cachedProfileData');
          MySharedPreferences.delete('cachedLaunchPads');
          MySharedPreferences.delete('cachedRockets');
          showToast(text: 'Logout done successfully');
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (route) => false,
          );
        } else if (state is LogoutFailure) {
          showToast(text: state.errorMessage);
        }
      },
      child: ProfileComponent(
        title: "Log out",
        icon: Icons.logout,
        onTap: () {
          context.read<LogoutCubit>().logout();
        },
      ),
    );
  }
}
