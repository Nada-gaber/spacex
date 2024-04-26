import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/cloud_firestore_failure.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;

  ProfileRepo(this.firebaseFirestoreInstance);

  Future<Either<Failure, Unit>> editProfileData(UserModel userModel) async {
    try {
      await firebaseFirestoreInstance
          .collection('users')
          .doc(userModel.token)
          .update(userModel.toMap());
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(CloudFirestoreFailure(error.toString()));
      }
    }
  }
}
