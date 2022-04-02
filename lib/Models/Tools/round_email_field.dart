import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const RoundedInputEmailField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: ((value) =>
            value!.isNotEmpty ? null : "This field is required"),
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorColor: const Color.fromARGB(237, 1, 19, 36),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(237, 1, 19, 36),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
