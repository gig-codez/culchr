import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:culchr/Models/Tools/rounded_input_field.dart';
import 'package:culchr/Models/Tools/rounded_password_field.dart';
import 'package:culchr/Models/Tools/social_icon.dart';
import 'package:culchr/Screens/SignUp/Details.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool scrol = false;
  TextEditingController usernameController = TextEditingController();
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
                      "Create account",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 26,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Discover an amazing event',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RoundedInputField(
                      controller: usernameController,
                      hintText: 'Enter firstname',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RoundedInputField(
                      controller: usernameController,
                      hintText: 'Enter lastname',
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Enter your email",
                    controller: emailController,
                    icon: Icons.mail,
                  ),
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
                            style: TextStyle(
                                // color: Color.fromARGB(255, 6, 71, 124),
                                fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RoundedButton(
                      text: "Continue",
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Details(),
                          ),
                        );
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
                        "Already have an account",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text(
                          "Login",
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
