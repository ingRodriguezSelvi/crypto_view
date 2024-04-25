import 'package:flutter/material.dart';

class AuthBottomNavigationBar extends StatelessWidget {

  final VoidCallback onPressedLabel;
  final VoidCallback onPressedButton;

  final String label;
  final String labelPressed;
  final String buttonLabel;
  final bool   isLoading;

  const AuthBottomNavigationBar({
    super.key, required this.onPressedLabel, required this.onPressedButton, required this.label, required this.buttonLabel, required this.labelPressed, required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
                TextButton(
                  onPressed: onPressedLabel,
                  child: Text(labelPressed,style: const TextStyle(color: Color(0xff0747A1))),
                )
              ],
            ),
            ElevatedButton(
              onPressed: isLoading ? null : onPressedButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D99FF),
                minimumSize: const Size(327, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child:   Text(buttonLabel, style: const TextStyle(fontSize: 16,color: Colors.white)),
            )
          ],
        )
    );
  }
}
