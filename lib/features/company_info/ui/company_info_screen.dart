import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/color/app_color.dart';
import 'package:spacex/features/company_info/ui/widgets/buildin_column.dart';
import 'package:spacex/features/company_info/ui/widgets/company_links_row.dart';
import '../../../core/constant/images.dart';
import '../../../core/networking/web_services.dart';
import '../bussiness_logic/cubit/company_info_cubit.dart';
import '../bussiness_logic/cubit/company_info_states.dart';
import '../data/repo/company_info_repo.dart';
import 'widgets/company_info_appbar.dart';
import '../../../core/widgets/text_style.dart';

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

      child: BlocConsumer<CompanyCubit, CompanyInfoState>(
        listener: (context, state) {
          if (state is CompanyError) {
            final errorState = state;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $errorState'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CompanyInitial) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColor.blueGrey,
            ));
          } else if (state is CompanyLoading) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColor.buttonColor,
            ));
          } else if (state is CompanyLoaded) {
            final companyInfo = state.companyInfo;
            return Scaffold(
              backgroundColor: const Color(0xff061428),
              appBar: companyInfoAppBar(context, '${companyInfo.summary}'),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      textStyle('${companyInfo.ceo}', 25),
                      textStyle('ceo of spaceX', 15,
                          fontWeight: FontWeight.w400),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          buildInfoColumn(
                              '${companyInfo.employees}', 'employees'),
                          buildInfoColumn('${companyInfo.vehicles}', 'launch'),
                          buildInfoColumn('${companyInfo.founded}', 'founded'),
                        ],
                      ),
                      const SizedBox(height: 45),
                      companyLinkRow(
                          '${companyInfo.links?.twitter}',
                          '${companyInfo.links?.website}',
                          '${companyInfo.links?.flickr}'),
                      const SizedBox(height: 25),
                      Image.asset(MyImages.elonMask),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CompanyError) {
            return const Text('Error fetching company info.');
          } else {
            return Text('Unexpected state: $state');
          }
        },
      ),
    );
  }
}
