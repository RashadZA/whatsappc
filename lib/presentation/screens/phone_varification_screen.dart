import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsappc/presentation/screens/set_initial_profile_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {

  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  verifyYourPhoneNumber,
                  style: AppTextTheme.text18.copyWith(color: greenColor),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              messageForEnterCountryCodeAndPhoneNumber,
              style:
              AppTextTheme.text16.copyWith(overflow: TextOverflow.visible),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            _pinCodeWidget(context),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed:(){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SetInitialProfileScreen(),
                        ),
                            (route) => false);
                  },
                  child: Text(
                    next,
                    style: AppTextTheme.text18.copyWith(color: whiteColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          PinCodeTextField(
            appContext: context,
            controller: _pinCodeController,
            length: 6,
            backgroundColor: Colors.transparent,
            obscureText: true,
            autoDisposeControllers: false,
            onChanged: (pinCode){
              debugPrint(pinCode);
            },
          ),
          const Text(enter6DigitCode)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
