import 'package:flutter/material.dart';
import 'package:kimo_chat/auth/auth_service.dart';
import 'package:kimo_chat/components/my_drawer.dart';

class HomPage extends StatelessWidget {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const MyDrawer());
  }
}
