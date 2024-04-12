import 'package:flutter/material.dart';
import 'package:kimo_chat/components/my_button.dart';
import 'package:kimo_chat/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final Function() onTap;
  RegisterPage({super.key, required this.onTap});
  void register() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50),
          // welcome back message
          Text(
            "Welcome back,you've been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),
          // email textfield
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(height: 25),

          // pw textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 25),

          // pw textfield
          MyTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPwController,
          ),
          const SizedBox(height: 25),

          // login button
          MyButton(
            text: 'Register',
            onTap: register,
          ),

          const SizedBox(height: 25),

          // register now button

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have a account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  )),
              GestureDetector(
                onTap: onTap,
                child: Text("Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          )
        ],
      )),
    );
  }
}
