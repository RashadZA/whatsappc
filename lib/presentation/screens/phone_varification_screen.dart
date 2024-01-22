import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsappc/presentation/bloc/phoneAuth/phone_auth_cubit.dart';
import 'package:whatsappc/presentation/screens/set_initial_profile_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class PhoneVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const PhoneVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {

  String get _phoneNumber => widget.phoneNumber;

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
                  onPressed:_submitSmsCode,
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
  void _submitSmsCode(){
    if (_pinCodeController.text.isNotEmpty){
      BlocProvider.of<PhoneAuthCubit>(context)
          .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
