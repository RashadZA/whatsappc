import 'package:flutter/material.dart';
import 'package:whatsappc/utils/design_utils.dart';

class CustomTabBar extends StatelessWidget {
  final int index;

  const CustomTabBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: primaryColor),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 40,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: "CHATS",
              textColor: index == 1 ? textIconColor : textIconColorGray,
              borderColor: index == 1 ? textIconColor : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: "STATUS",
              textColor: index == 2 ? textIconColor : textIconColorGray,
              borderColor: index == 2 ? textIconColor : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: "CALLS",
              textColor: index == 3 ? textIconColor : textIconColorGray,
              borderColor: index == 3 ? textIconColor : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton({
  super.key,
    required this.text,
    required this.borderColor,
    required this.textColor,
    this.borderWidth=3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Text(
        text,
        style: AppTextTheme.text16.copyWith(color: textColor),
      ),
    );
  }
}