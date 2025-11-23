import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key, this.textEditingController, this.label = "Password"});
  final TextEditingController? textEditingController;
  final String label;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: widget.label,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      obscureText: !isVisible,
    );
  }
}