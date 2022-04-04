import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:culchr/Models/Tools/rounded_input_field.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  var newpassController = TextEditingController();
  var confirmpassController = TextEditingController();
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
                      "New Password",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 26,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Create your new password to login',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.black38),
                    ),
                  ),
                  RoundedInputField(
                      hintText: "New Password", controller: newpassController),
                  RoundedInputField(
                      hintText: "New Password",
                      controller: confirmpassController),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RoundedButton(
                      text: "Reset Password",
                      press: () {},
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
