import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              child: Text(label),
              onPressed: onPressed,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
            )
          : ElevatedButton(
              child: Text(label),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge!.color,
              ),
              onPressed: onPressed,
            ),
    );
  }
}
