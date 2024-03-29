import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/startupScreens/registration_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              welcomeToWhatsAppClone,
              style: AppTextTheme.text20.copyWith(color: primaryColor,fontWeight: FontWeight.bold,),
            ),
            imageFromAsset(
              height: 290,
              width: 290,
              imagePath: AppImages.brand,
            ),
            Column(
              children: <Widget>[
                const Text(
                  readOurPolicyTapMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    agreeAndContinue,
                    style: AppTextTheme.text18.copyWith(color: whiteColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}