import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:culchr/Models/Tools/rounded_input_field.dart';
import 'package:culchr/Models/Tools/rounded_password_field.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var countryController = TextEditingController();
  var registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: registerKey,
          child: ListView(
            children: [
              const Hero(
                transitionOnUserGestures: true,
                tag: 'tag',
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Discover an amazing event",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 17,
                  ),
                ),
              ),
              RoundedInputField(
                hintText: "Country",
                controller: countryController,
                icon: Icons.place,
              ),
              RoundedInputField(
                  hintText: "Phone",
                  controller: countryController,
                  icon: Icons.phone),
              RoundedPasswordField(
                hintText: "Enter your password",
                controller: countryController,
              ),
              RoundedPasswordField(
                hintText: "Confirm Password",
                controller: countryController,
              ),
              RoundedButton(
                text: "Register",
                press: () {
                  Navigator.of(context).pushNamed('/interest');
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
