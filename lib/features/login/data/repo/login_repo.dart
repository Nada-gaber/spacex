import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacex/features/login/data/models/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth firebaseAuthInstance;

  LoginRepo(this.firebaseAuthInstance);

  Future login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      return response;
    } catch (error) {
      //ToDo handle error login
    }
  }
}
