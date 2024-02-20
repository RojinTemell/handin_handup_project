import 'package:flutter/material.dart';
import 'package:handinhandup/features/mixin/navigate_mixin.dart';
import 'package:handinhandup/features/view/home_sceen.dart';
import 'package:handinhandup/features/view/info_screen.dart';
import 'package:provider/provider.dart';

import '../../exam.dart';
import '../services/auth_service.dart';
import '../widget/widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _mailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    Future<void> signUp() async {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signUpUser(_mailController.text,
            _passwordController.text, _nameController.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImageWidget(
          url:
              'https://cdn.pixabay.com/photo/2016/11/08/05/20/sunset-1807524_1280.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HAND IN HAND UP',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  TextFormFieldWidget(
                    keyboardType: TextInputType.name,
                    hintText: 'Name',
                    controller: _nameController,
                  ),
                  TextFormFieldWidget(
                    controller: _mailController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Email',
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
                      title: 'SIGN UP ',
                      width: size.width * 0.7,
                      color: const Color.fromARGB(255, 220, 96, 13),
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          signUp();
                          navigateToWidget(context, const InfoScreen());
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 30),
                    child: Row(
                      children: [
                        const Text(
                          "Do you have account?   ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {
                              navigateToWidget(context, const LoginScreen());
                            },
                            child: const Text(
                              'Login',
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
