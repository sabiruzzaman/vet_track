import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final FormFieldValidator<String>? validator;

  const PasswordTextFieldWidget({
    super.key,
    this.controller,
    this.labelText = 'Password',
    this.validator,
  });

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(24), // optional for rounded ripple bounds
          onTap: _toggleVisibility,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Transform.rotate(
                angle: _obscureText ? 0 : math.pi,
                child: SvgPicture.asset(
                  'assets/icons/eye_closed.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),


      ),
    );
  }
}
