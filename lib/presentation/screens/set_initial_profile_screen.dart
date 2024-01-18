import 'package:flutter/material.dart';
import 'package:whatsappc/utils/design_utils.dart';


class SetInitialProfileScreen extends StatefulWidget {
  const SetInitialProfileScreen({super.key});

  @override
  State<SetInitialProfileScreen> createState() => _SetInitialProfileScreenState();
}

class _SetInitialProfileScreenState extends State<SetInitialProfileScreen> {

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
              style: AppTextTheme.text18.copyWith(color: greenColor,
                fontWeight: FontWeight.bold,),
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
                  onPressed: (){},
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

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
