import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:culchr/Models/Tools/rounded_input_field.dart';
import 'package:culchr/Models/Tools/rounded_password_field.dart';
import 'package:culchr/Models/Tools/social_icon.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool scrol = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Login to your account",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 26,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hi Welcome back',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.black38),
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Input Email",
                    controller: emailController,
                    icon: Icons.mail,
                  ),
                  RoundedPasswordField(
                      hintText: "Input Password",
                      controller: passwordController),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: scrol,
                              onChanged: (g) {
                                setState(() {
                                  scrol = !scrol;
                                });
                              },
                              side: const BorderSide(
                                width: 0.5,
                                color: Colors.black38,
                              ),
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/forgot');
                          },
                          child: const Text(
                            "Forgot password",
                            style: TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RoundedButton(
                      text: "Login",
                      press: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      color: scrol == true ? Colors.black : Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalIcon(
                        iconColor: Colors.black38,
                        iconSrc: 'images/apple.svg',
                        press: () {},
                      ),
                      SocalIcon(
                        iconColor: Colors.black38,
                        iconSrc: 'images/google.svg',
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't  have an account",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
