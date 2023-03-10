import 'package:amazon_clone_flutter/pages/auth/services/auth_service.dart';
import 'package:flutter/material.dart'; 

import '../../../res/widgets/cust_button.dart';
import '../../../consts/global_var.dart';
import '../../../res/widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEn _auth = AuthEn.signup;
  final AuthService _authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void signup() {
    _authService.signUp(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signin() {
    _authService.signIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22),
              ),
              ListTile(
                title: const Text(
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
              if (_auth == AuthEn.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.greyBackgroundCOlor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signup();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                title: const Text(
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
              if (_auth == AuthEn.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.greyBackgroundCOlor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signin();
                            }
                          },
                        )
                      ],
                    ),
                  ),
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
