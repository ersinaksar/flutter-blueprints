import '../../../../domain/common/entities/user.dart';
import '../entities/chat_room.dart';

abstract class ChatMediator {
  void sendMessage(String message, User user);

  void addUser(User user, ChatRoom chatRoom);
}
