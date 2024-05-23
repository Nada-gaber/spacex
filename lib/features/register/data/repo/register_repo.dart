import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacex/core/errors/cloud_firestore_failure.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/firebase_auth_failure.dart';
import 'package:spacex/features/home/data/models/user_model.dart';
import 'package:spacex/features/register/data/models/register_request_model.dart';
import 'package:spacex/core/constant/images.dart';

class RegisterRepo {
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseFirestoreInstance;

  RegisterRepo(
    this.firebaseAuthInstance,
    this.firebaseFirestoreInstance,
  );

  Future<Either<Failure, UserModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      );
      UserModel userModel = UserModel(
        name: registerRequestModel.name,
        image: MyImages.profileImage,
        token: response.user?.uid ?? '',
      );
      return Right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> createUser(UserModel userModel) async {
    try {
      await firebaseFirestoreInstance
          .collection('users')
          .doc(userModel.token)
          .set(userModel.toMap());
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
