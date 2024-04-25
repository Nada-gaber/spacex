import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class HomeRepo {
  final FirebaseFirestore firebaseFirestoreInstance;

  HomeRepo(this.firebaseFirestoreInstance);

  Future<Either<Failure, UserModel>> getProfileData(String token) async {
    try {
      final response =
          await firebaseFirestoreInstance.collection('users').doc(token).get();
      var userModel = UserModel.fromJson(response.data()!);
      return Right(userModel);
    } catch (error) {
      // ToDo handle cloudFirestoreFailure
    }
  }
}
