import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/screens/phone_varification_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("880");

  String _countryCode = "+880";

  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
            ListTile(
              onTap: () => _openFilteredCountryPickerDialog(bContext: context),
              title: _buildDialogItem(_selectedFilteredDialogCountry),
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1.50,
                    color: greenColor,
                  ))),
                  width: 80,
                  height: 42,
                  alignment: Alignment.center,
                  child: Text(_selectedFilteredDialogCountry.phoneCode),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(hintText: phoneNumber),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PhoneVerificationScreen(),
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

  void _openFilteredCountryPickerDialog({required BuildContext bContext}) {
    showDialog(
      context: bContext,
      builder: (_) => Theme(
        data: Theme.of(bContext).copyWith(
          primaryColor: primaryColor,
        ),
        child: CountryPickerDialog(
          titlePadding: const EdgeInsets.all(0.8),
          searchCursorColor: blackColor,
          searchInputDecoration: const InputDecoration(
            hintText: search,
          ),
          title: const Text(selectYourPhoneCode),
          onValuePicked: (Country country) {
            setState(() {
              _selectedFilteredDialogCountry = country;
              _countryCode = country.phoneCode;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    double deviceWidth = MediaQuery.of(context).size.width * 0.8;
    double widgetsWidthAfterRemovingPadding = deviceWidth - 116;
    return Container(
      width: deviceWidth,
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 8.0,
          ),
          SizedBox(
            width: widgetsWidthAfterRemovingPadding * 0.2,
            child: Text(
              "+${country.phoneCode}",
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          SizedBox(
            width: widgetsWidthAfterRemovingPadding * 0.8,
            child: Text(
              country.name,
            ),
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
