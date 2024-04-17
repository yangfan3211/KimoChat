import 'package:flutter/material.dart';
import 'package:kimo_chat/components/my_drawer.dart';
import 'package:kimo_chat/components/user_tile.dart';
import 'package:kimo_chat/pages/chat_page.dart';
import 'package:kimo_chat/services/auth/auth_service.dart';
import 'package:kimo_chat/services/chat/chat_service.dart';

class HomPage extends StatelessWidget {
  HomPage({super.key});
// chat/auth service

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const MyDrawer(),
        body: _buildUserList());
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except the current user
    return UserTile(
      text: userData["email"],
      onTap: () {
        //navigate to chat page
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
              ),
            ));
      },
    );
  }
}
