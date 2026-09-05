import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outlined = false,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool outlined;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Text(label),
            ],
          );

    if (outlined) {
      return OutlinedButton(onPressed: onPressed, child: child);
    }
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}
