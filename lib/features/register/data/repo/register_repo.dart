import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacex/core/errors/failure.dart';
import 'package:spacex/core/errors/firebase_auth_failure.dart';
import 'package:spacex/features/register/data/models/register_request_model.dart';

class RegisterRepo {
  final FirebaseAuth firebaseAuthInstance;

  RegisterRepo(this.firebaseAuthInstance);

  Future<Either<Failure, UserCredential>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      );
      return Right(response);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
