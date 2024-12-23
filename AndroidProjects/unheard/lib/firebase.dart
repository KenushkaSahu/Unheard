import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User signed up: ${userCredential.user?.email}");
  } catch (e) {
    print("Sign up failed: $e");
  }
}
