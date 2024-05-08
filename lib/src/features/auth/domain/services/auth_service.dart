// # Domain service
// lib/src/features/auth/domain/services/auth_service.dart
import '../../../../domain/common/entities/user.dart';
import '../repositories/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<User?> signUp(String email, String password) =>
      _authRepository.signUp(email, password);

  Future<User?> signIn(String email, String password) =>
      _authRepository.signIn(email, password);

  Future<void> signOut() => _authRepository.signOut();
}
