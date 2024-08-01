import 'package:flutter/material.dart';
import 'package:testapp/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.elliptical(10, 5),
            right: Radius.elliptical(10, 5),
          ),
          color: AppColors.buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
