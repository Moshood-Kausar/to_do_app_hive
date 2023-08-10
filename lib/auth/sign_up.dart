import 'package:flutter/material.dart';
import 'package:to_do_app_hive/widget/routes.dart';
import 'package:to_do_app_hive/widget/text_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordd = TextEditingController();

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
                  height: 20,
                ),
                const Text(
                  'TO DO APP(HIVE)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome,Kindly input your details',
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
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _firstname,
                        text: 'Firt name',
                        hintText: 'Kausar',
                      ),
                      AppTextFormField(
                        controller: _lastname,
                        text: 'Last Name',
                        hintText: 'kausarmoshood@gmail.com',
                      ),
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
                      AppTextFormField(
                        controller: _passwordd,
                        text: 'Confirm Password',
                        hintText: '*******',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('SIGN UP'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, loginRoute);
                    },
                    child: const Text('Already have an account? Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
