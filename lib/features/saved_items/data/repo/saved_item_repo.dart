import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/database_failure.dart';
import 'package:spacex/core/utils/database_helper.dart';
import 'package:spacex/features/saved_items/data/models/saved_item.dart';

import '../../../../core/errors/failure.dart';

class SavedItemsRepo {
  final DataBaseHelper dataBaseHelper;

  SavedItemsRepo(this.dataBaseHelper);

  Future<Either<Failure, List<SavedItemModel>>> getSavedItems() async {
    try {
      final savedItem = await dataBaseHelper.getSavedItems();
      return Right(savedItem);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }


  isSaved(String title)async{
    try {
      final savedItem = await dataBaseHelper.isSaved(title);
      return Right(savedItem);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }



}
