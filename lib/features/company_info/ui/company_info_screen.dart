import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/utils/dependency_injection.dart';
import 'package:spacex/core/widgets/custom_loading_widget.dart';
import 'package:spacex/features/company_info/ui/widgets/company_info_appbar.dart';
import 'package:spacex/features/company_info/ui/widgets/company_loaded.dart';
import '../../../core/widgets/custom_failure_widget.dart';
import '../business_logic/cubit/company_info_cubit.dart';
import '../business_logic/cubit/company_info_states.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
           create: (context)  => getIt.get<CompanyCubit>()..fetchCompanyInfo(),

       
        child: Scaffold(
          appBar: companyInfoAppBar(
            context,
          ),
          backgroundColor: AppColors.backgroundDarkBlue,
          body: BlocBuilder<CompanyCubit, CompanyInfoState>(
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
                  companyInfoLinksFlickr: '${companyInfo.links?.flickr}',
                  companyInfoSummary: '${companyInfo.summary}',
                );
              } else if (state is CompanyError) {
                return Center(
                  child: CustomFailureWidget(
                    textError: state.error,
                    textSize: 24,
                  ),
                );
              } else {
                return const CustomLoadingWidget();
              }
            },
          ),
        ));
  }
}
