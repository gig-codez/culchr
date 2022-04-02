import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:culchr/Models/Tools/rounded_input_field.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  "Forgot password",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Type your email, we will send you verivication code via email"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                RoundedInputField(
                  icon: Icons.mail,
                  hintText: "Enter your email",
                  controller: emailController,
                ),
                RoundedButton(text: "Submit", press: () {}, color: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
