import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappc/presentation/bloc/phoneAuth/phone_auth_cubit.dart';
import 'package:whatsappc/presentation/screens/homeScreen/home_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class SetInitialProfileScreen extends StatefulWidget {
  final String phoneNumber;
   const SetInitialProfileScreen({super.key, required this.phoneNumber});

  @override
  State<SetInitialProfileScreen> createState() =>
      _SetInitialProfileScreenState();
}

class _SetInitialProfileScreenState extends State<SetInitialProfileScreen> {

  String get _phoneNumber => widget.phoneNumber;

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: <Widget>[
            Text(
              profileInfo,
              style: AppTextTheme.text18.copyWith(
                color: greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              pleaseProvideNameAndOptionalPhoto,
              textAlign: TextAlign.center,
              style: AppTextTheme.text16,
            ),
            const SizedBox(
              height: 30,
            ),
            _rowWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: _submitProfileInfo,
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

  Widget _rowWidget() {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.camera_alt),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: enterYourName,
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.insert_emoticon),
        )
      ],
    );
  }
  void _submitProfileInfo() {
    if (_nameController.text.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
          profileUrl: "",
          phoneNumber: _phoneNumber,
          name: _nameController.text);
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
