import 'package:bloc/bloc.dart';
import 'package:spacex/features/ships/business_logic/cubit/ships_states.dart';
import '../../data/repo/company_info_repo.dart';
import 'company_info_states.dart';

class CompanyCubit extends Cubit<CompanyInfoState> {
  final CompanyRepository _companyRepository;

  CompanyCubit(this._companyRepository) : super(CompanyInitial());

  Future fetchCompanyInfo() async {
    emit(CompanyLoading());
    final companyInfo = await _companyRepository.getCompanyInfo();
    companyInfo.fold((failure) => emit(CompanyError(failure.message)),
        (companyInfo) => emit(CompanyLoaded(companyInfo)));
  }
}
