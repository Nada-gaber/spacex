

import 'package:sqflite/sqflite.dart';

import 'failure.dart';

class DatabaseFailure extends Failure {

  DatabaseFailure(super.message);

  factory DatabaseFailure.fromException(Exception exception) {
    if (exception is DatabaseException) {
      return DatabaseFailure("Unknown Database Error");
    } else {

      return DatabaseFailure("An unexpected error occurred");
    }
  }
}