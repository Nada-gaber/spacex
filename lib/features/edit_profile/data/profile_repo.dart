import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:spacex/core/errors/cloud_firestore_failure.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/firebase_storage_failure.dart';
import 'package:spacex/features/home/data/models/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;
  final FirebaseStorage firebaseStorageInstance;

  ProfileRepo(
    this.firebaseFirestoreInstance,
    this.firebaseStorageInstance,
  );

  Future<Either<Failure, Unit>> editProfileData(UserModel userModel) async {
    try {
      await firebaseFirestoreInstance
          .collection('users')
          .doc('GtummCYmQxNFLpBlT5iT')
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

  Future<Either<Failure, String>> uploadProfileImage(File file, String imagePath) async{
    try {
      Reference reference = firebaseStorageInstance.ref('profile').child(imagePath);
      await reference.putFile(file);
      String imageUrl = await reference.getDownloadURL();
      return Right(imageUrl);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> deleteProfileImage(String imagePath) async{
    try {
      Reference reference = firebaseStorageInstance.ref('profile').child(imagePath);
      await reference.delete();
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }
    }
  }
}
