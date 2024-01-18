import 'package:flutter/material.dart';
import 'package:whatsappc/utils/design_utils.dart';
class CoreMaterialButton extends StatelessWidget {
  final void Function() onTap;
  const CoreMaterialButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: greenColor,
      onPressed: () => onTap(),
      child: Text(
        next,
        style: AppTextTheme.text18.copyWith(color: whiteColor),
      ),
    );
  }
}
