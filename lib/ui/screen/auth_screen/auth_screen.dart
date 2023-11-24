import 'package:ecommerceapp_firebase/helper/firebase_auth/firebae_auth_helper.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/login_screen/login_screen.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/welcome/welcome_screen.dart';
import 'package:ecommerceapp_firebase/ui/screen/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
