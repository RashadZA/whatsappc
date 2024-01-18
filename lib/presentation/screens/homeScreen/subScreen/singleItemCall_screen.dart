import 'package:flutter/material.dart';
import 'package:whatsappc/utils/design_utils.dart';

class SingleItemCallScreen extends StatelessWidget {
  const SingleItemCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  imageFromAssetWithClipRRect(height: 55,width: 55,),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "User Name",
                        style: AppTextTheme.text18,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.call_received,
                            color: primaryColor,
                            size: 18,
                          ),
                          Text(
                            "Yesterday",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Icon(Icons.call,color: primaryColor,)
            ],
          ),
          const  Padding(
            padding: EdgeInsets.only(left: 60, right: 10),
            child: Divider(
              thickness: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}