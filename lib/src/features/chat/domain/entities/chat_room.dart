import '../../../../domain/common/entities/user.dart';

class ChatRoom {
  late final String id;
  final List<User> users = [];

  void broadcastMessage(String message, User sender) {
    for (var user in users) {
      if (user != sender) {
        print('Message from ${sender.id} to ${user.id}: $message');
      }
    }
  }

  void addUser(User user) {
    users.add(user);
    print('${user.id} has joined the room.');
  }
}
