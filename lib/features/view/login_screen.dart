import 'package:flutter/material.dart';
import 'package:handinhandup/exam.dart';
import 'package:handinhandup/features/mixin/navigate_mixin.dart';
import 'package:handinhandup/features/view/home_sceen.dart';
import 'package:handinhandup/features/view/signup_screen.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../widget/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _mailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Future<void> signIn() async {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signInUser(
            _passwordController.text, _mailController.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    return Stack(
      children: [
             const BackgroundImageWidget(url: 'https://cdn.pixabay.com/photo/2016/11/08/05/20/sunset-1807524_1280.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      """Together, we can make a difference in someone's life.""",
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    controller: _mailController,
                  ),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Password',
                    visiblePassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: BottonWidget(
                      title: 'LOGIN',
                      width: size.width * 0.7,
                      color: const Color.fromARGB(255, 220, 96, 13),
                      callback: () {

                        if (_formKey.currentState!.validate()) {
                                signIn();
                                navigateToWidget(context, const HomeScreen());
                              }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 30),
                    child: Row(
                      children: [
                        const Text(
                          "Don't you have account?  ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {
                              
                              navigateToWidget(context, const SignUpScreen());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 220, 96, 13),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
