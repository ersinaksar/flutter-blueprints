import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import '../entities/user.dart';

class UserSessionManager {
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;
  User? _currentUser;

  UserSessionManager() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(fb_auth.User? firebaseUser) {
    _currentUser =
        firebaseUser != null ? User.fromFirebaseUser(firebaseUser) : null;
  }

  User? get currentUser => _currentUser;
}
