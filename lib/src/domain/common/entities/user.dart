import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

class User {
  final String id;
  final String email;

  User({required this.id, required this.email});

  // Factory constructor to create a User from a Firebase User
  factory User.fromFirebaseUser(fb_auth.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
    );
  }
}
