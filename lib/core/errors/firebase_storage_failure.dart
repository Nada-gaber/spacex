import 'package:firebase_storage/firebase_storage.dart';
import 'package:spacex/core/errors/failure.dart';

class FirebaseStorageFailure extends Failure {
  FirebaseStorageFailure(super.message);

  factory FirebaseStorageFailure.fromFirebaseCoreException(
      FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case 'unknown':
        return FirebaseStorageFailure('An unknown error occurred.');
      case 'object-not-found':
        return FirebaseStorageFailure(
            'No object exists at the desired reference.');
      case 'bucket-not-found':
        return FirebaseStorageFailure(
            'No bucket is configured for Cloud Storage');
      case 'project-not-found':
        return FirebaseStorageFailure(
            'No project is configured for Cloud Storage');
      case 'quota-exceeded':
        return FirebaseStorageFailure(
            'Quota on your Cloud Storage bucket has been exceeded. If you\'re on the no-cost tier, upgrade to a paid plan. If you\'re on a paid plan, reach out to Firebase support.');
      case 'unauthenticated':
        return FirebaseStorageFailure(
            'User is unauthenticated, please authenticate and try again.');
      case 'unauthorized':
        return FirebaseStorageFailure(
            'User is not authorized to perform the desired action, check your security rules to ensure they are correct.');
      case 'retry-limit-exceeded':
        return FirebaseStorageFailure(
            'The maximum time limit on an operation (upload, download, delete, etc.) has been excceded. Try uploading again.');
      case 'invalid-checksum':
        return FirebaseStorageFailure(
            'File on the client does not match the checksum of the file received by the server. Try uploading again.');
      case 'canceled':
        return FirebaseStorageFailure('User canceled the operation.');
      case 'invalid-event-name':
        return FirebaseStorageFailure('Invalid event name provided. Must be one of [`running`, `progress`, `pause`]');
      default:
        return FirebaseStorageFailure('An unknown error occurred.');
    }
  }
}
