import 'package:culchr/Models/Tools/rounded_button.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pinput/pin_put/pin_put.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  // ignore: unused_field
  final bool _isLoading = false;
  late String verifypin;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: kappPrimary),
      color: Colors.white70,
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  final Color kappPrimary = Colors.blue;
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
                      "Verify Code",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 26,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'The verification code was sent via email' +
                          '\n' +
                          'arnoldrutanana@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  pinArea(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Did get the code ?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  RoundedButton(
                      text: "Verify Now",
                      press: () {
                        Navigator.of(context).pushNamed('/interests');
                      },
                      color: Colors.black)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pinArea() {
    return Container(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        padding: const EdgeInsets.all(25.0),
        child: PinPut(
          eachFieldConstraints:
              const BoxConstraints(minWidth: 55.0, minHeight: 60.0),
          fieldsCount: 4,
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(5.0),
          ),
          selectedFieldDecoration: _pinPutDecoration,
          followingFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: kappPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
