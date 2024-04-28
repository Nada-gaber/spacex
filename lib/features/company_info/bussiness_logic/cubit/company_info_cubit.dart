import 'package:bloc/bloc.dart';
import '../../data/repo/company_info_repo.dart';
import 'company_info_states.dart';

class CompanyCubit extends Cubit<CompanyInfoState> {
  final CompanyRepository _companyRepository;

  CompanyCubit(this._companyRepository): super(CompanyInitial());

  Future<void> fetchCompanyInfo() async {
    emit( CompanyLoading());
    try {
      final companyInfo = await _companyRepository.getCompanyInfo();
      emit(CompanyLoaded(companyInfo ));
    } on Exception catch (error) {
      emit(CompanyError(error.toString()));
    }
  }
}