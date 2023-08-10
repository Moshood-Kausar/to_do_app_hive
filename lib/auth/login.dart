import 'package:flutter/material.dart';

import 'package:to_do_app_hive/widget/routes.dart';
import 'package:to_do_app_hive/widget/text_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'TO DO APP(HIVE)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome Back!\n Kindly input your login details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
            Form(
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _email,
                        text: 'Email',
                        hintText: 'kausarmoshood@gmail.com',
                      ),
                      AppTextFormField(
                        controller: _password,
                        text: 'Password',
                        hintText: '*******',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FilledButton(
                  onPressed: () {
                     Navigator.pushNamed(context, homepageRoute);
                  },
                  child: const Text('LOGIN'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, signupRoute);
                    },
                    child: const Text('Don\'t have an account yet? Sign Up'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
