import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Color txtColor;
  Color bgColor;
  CustomButton({
    super.key,
    required this.title,
    required this.txtColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 48,
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: txtColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
