import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappc/utils/design_utils.dart';

class SingleItemChatUserScreen extends StatelessWidget {
  final String time;
  final String recentSendMessage;
  final String name;

  const SingleItemChatUserScreen(
      {super.key,
      required this.time,
      required this.recentSendMessage,
      required this.name});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    double widthOfNameAndMessageColumn = width - 10 - 55 - 10 - 10 - 75;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80,
        width: width,
        decoration: BoxDecoration(
          color: cardColorGray,
            borderRadius: BorderRadius.circular(25),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 10,),
            imageFromAssetWithClipRRect(height: 55,width: 55,),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: widthOfNameAndMessageColumn,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTextTheme.text18,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    recentSendMessage,
                    maxLines: 2,
                    style: AppTextTheme.text14,
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
                width: 70,
                child: Text(time,style: AppTextTheme.text14,),),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
