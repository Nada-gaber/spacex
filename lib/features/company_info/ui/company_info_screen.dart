import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/widgets/custom_loading_widget.dart';
import 'package:spacex/features/company_info/ui/widgets/company_loaded.dart';

import '../../../core/networking/web_services.dart';
import '../../../core/widgets/custom_failure_widget.dart';
import '../business_logic/cubit/company_info_cubit.dart';
import '../business_logic/cubit/company_info_states.dart';
import '../data/repo/company_info_repo.dart';
import 'widgets/company_appbar_error.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
      create: (context) {
        final cubit = CompanyCubit(CompanyRepository(WebServices(Dio())));
        cubit.fetchCompanyInfo();
        return cubit;
      },
      child: BlocBuilder<CompanyCubit, CompanyInfoState>(
        builder: (context, state) {
          if (state is CompanyLoaded) {
            final companyInfo = state.companyInfo;
            return CompanyInfoLoaded(
                summary: '${companyInfo.summary}',
                companyInfoCeo: '${companyInfo.ceo}',
                companyInfoEmployees: '${companyInfo.employees}',
                companyInfoVehicles: '${companyInfo.vehicles}',
                companyInfoFounded: '${companyInfo.founded}',
                companyInfoLinksTwitter: '${companyInfo.links?.twitter}',
                companyInfoLinksWebsite: '${companyInfo.links?.website}',
                companyInfoLinksFlickr: '${companyInfo.links?.flickr}');
          } else if (state is CompanyError) {
            return Scaffold(
              backgroundColor: AppColors.backgroundDarkBlue,
              appBar: companyInfoErrorAppBar(context),
              body: Center(
                child: CustomFailureWidget(
                  textError: state.error,
                  textSize: 24,
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: AppColors.backgroundDarkBlue,
              appBar: companyInfoErrorAppBar(context),
              body: const CustomLoadingWidget(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
