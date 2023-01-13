import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEn _auth = AuthEn.signup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22),
              ),
              ListTile(
                title: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    value: AuthEn.signup,
                    groupValue: _auth,
                    onChanged: (AuthEn? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              ListTile(
                title: Text(
                  'Sign-In',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    value: AuthEn.signin,
                    groupValue: _auth,
                    onChanged: (AuthEn? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum AuthEn {
  signup,
  signin;
}
