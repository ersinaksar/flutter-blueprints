import 'package:get_it/get_it.dart';
import '../../domain/common/services/user_session_manager.dart';
import '../../features/chat/data/repositories/chat_mediator_impl.dart';
import '../../features/chat/domain/services/chat_mediator.dart';

final getIt = GetIt.instance;

void setupInjection() {
  // Here you register all your dependencies
  getIt.registerSingleton<ChatMediator>(ChatMediatorImpl());
  getIt.registerSingleton<UserSessionManager>(UserSessionManager());
}
