import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter_modular/flutter_modular.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/services/auth_service.dart';
import 'features/auth/presentation/pages/login_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => fb_auth.FirebaseAuth.instance),
    // Ensure this is correct
    Bind.singleton<AuthRepository>(
        (i) => AuthRepositoryImpl(i.get<fb_auth.FirebaseAuth>())),
    Bind.singleton((i) => AuthService(i.get<AuthRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    // Define other module routes here
  ];
}
