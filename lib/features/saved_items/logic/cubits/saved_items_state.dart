part of 'saved_items_cubit.dart';

@immutable
abstract class SavedItemsState {}

class SavedItemsInitial extends SavedItemsState {}

class GetSavedItemsSuccess extends SavedItemsState {
  final List<SavedItemModel> savedItems;

  GetSavedItemsSuccess(this.savedItems);
}

class SavedItemsFailure extends SavedItemsState {
  final String errorMessage;

  SavedItemsFailure(this.errorMessage);
}

class SavedItemsLoading extends SavedItemsState {}


class ItemIsSaved extends SavedItemsState {
  final bool isSaved;

  ItemIsSaved(this.isSaved);
}

