import '../../../../domain/common/entities/user.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/services/chat_mediator.dart';

class ChatMediatorImpl implements ChatMediator {
  final List<ChatRoom> _chatRooms = [];

  @override
  void sendMessage(String message, User user) {
    final chatRoom = _chatRooms.firstWhere(
      (room) => room.users.contains(user),
      orElse: () => throw Exception("User not in any chat room"),
    );
    chatRoom.broadcastMessage(message, user);
  }

  @override
  void addUser(User user, ChatRoom chatRoom) {
    if (!_chatRooms.contains(chatRoom)) {
      _chatRooms.add(chatRoom);
    }
    chatRoom.addUser(user);
  }
}
