import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex/features/saved_items/data/repo/saved_item_repo.dart';

import '../../data/models/saved_item.dart';

part 'saved_items_state.dart';

class SavedItemsCubit extends Cubit<SavedItemsState> {
  SavedItemsCubit(this.savedItemsRepo) : super(SavedItemsInitial());
  final SavedItemsRepo savedItemsRepo;

  void getSavedItems() async {
    emit(SavedItemsLoading());
    var response = await savedItemsRepo.getSavedItems();

    response.fold((failure) {
      emit(SavedItemsFailure(failure.message));
    }, (savedItems) {
      emit(GetSavedItemsSuccess(savedItems));
    });
  }

  checkIsSaved(String title)async{
    emit(SavedItemsLoading());
    var response = await savedItemsRepo.isSaved(title);
    response.fold((failure) {
      emit(SavedItemsFailure(failure.message));
    }, (isSaved) {
      emit(ItemIsSaved(isSaved));
    });
  }

}
