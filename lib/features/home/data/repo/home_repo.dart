import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacex/core/errors/cloud_firestore_failure.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/firebase_auth_failure.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class HomeRepo {
  final FirebaseFirestore firebaseFirestoreInstance;
  final FirebaseAuth firebaseAuthInstance;

  HomeRepo(
    this.firebaseFirestoreInstance,
    this.firebaseAuthInstance,
  );

  Future<Either<Failure, UserModel>> getProfileData(String token) async {
    try {
      final response =
          await firebaseFirestoreInstance.collection('users').doc(token).get();
      UserModel userModel = UserModel.fromJson(response.data()!);
      return Right(userModel);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(CloudFirestoreFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> logout() async {
    try {
      await firebaseAuthInstance.signOut();
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
