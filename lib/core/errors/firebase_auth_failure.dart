import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacex/core/errors/failure.dart';

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);
  
  factory FirebaseAuthFailure.fromFirebaseAuthException(FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case 'invalid-email':
        return FirebaseAuthFailure('Invalid email address');
      case 'user-not-found':
        return FirebaseAuthFailure('User not found');
      case 'wrong-password':
        return FirebaseAuthFailure('Wrong password');
      case 'user-disabled':
        return FirebaseAuthFailure('User account is disabled');
      case 'email-already-in-use':
        return FirebaseAuthFailure('Email is already in use');
      case 'operation-not-allowed':
        return FirebaseAuthFailure('Operation not allowed');
      case 'too-many-requests':
        return FirebaseAuthFailure('Too many login attempts. Please try again later.');
      default:
        return FirebaseAuthFailure('login was canceled');
    }
  }
}
