import 'package:flutter/material.dart';

import '../../util/appColor.dart';

class SignItem extends StatelessWidget {
  String hintTxt;
  String icon;
  TextEditingController controller;
  SignItem(
      {super.key,
      required this.hintTxt,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: appColors.txtGrey, fontWeight: FontWeight.w300),
        prefixIcon: Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Image.asset(
            icon,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
