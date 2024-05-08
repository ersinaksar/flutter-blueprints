import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import '../../../../domain/common/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final fb_auth.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      final fb_auth.UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return User.fromFirebaseUser(result.user!); // Convert to domain user
    } catch (e) {
      throw Exception('Failed to sign up');
    }
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final fb_auth.UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return User.fromFirebaseUser(result.user!); // Convert to domain user
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
