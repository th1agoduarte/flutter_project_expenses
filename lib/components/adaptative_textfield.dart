import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.label,
    required this.onSubmitted,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CupertinoTextField(
                  placeholder: label,
                  controller: controller,
                  keyboardType: keyboardType,
                  onSubmitted: onSubmitted,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 12,
                  )),
            )
          : TextField(
              decoration: InputDecoration(
                labelText: label,
              ),
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
            ),
    );
  }
}
