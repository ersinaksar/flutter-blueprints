// # Abstracts the data layer
import '../../../../domain/common/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signUp(String email, String password);

  Future<User?> signIn(String email, String password);

  Future<void> signOut();
}
