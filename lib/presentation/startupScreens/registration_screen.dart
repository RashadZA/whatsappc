import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappc/data/models/user_model.dart';
import 'package:whatsappc/presentation/bloc/auth/auth_cubit.dart';
import 'package:whatsappc/presentation/bloc/phoneAuth/phone_auth_cubit.dart';
import 'package:whatsappc/presentation/bloc/user/user_cubit.dart';
import 'package:whatsappc/presentation/screens/homeScreen/home_screen.dart';
import 'package:whatsappc/presentation/screens/phone_varification_screen.dart';
import 'package:whatsappc/presentation/screens/set_initial_profile_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("880");

  String _countryCode = "880";
  String _phoneNumber="";

   TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        listener: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (phoneAuthState is PhoneAuthFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Something is wrong"),
                    Icon(Icons.error_outline)
                  ],
                ),
              ),
            ));
          }
        },
        builder: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthSmsCodeReceived) {
            return PhoneVerificationScreen(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthProfileInfo) {
            return SetInitialProfileScreen(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (phoneAuthState is PhoneAuthSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return BlocBuilder<UserCubit, UserState>(
                    builder: (context, userState) {
                      if (userState is UserLoaded) {
                        final currentUserInfo = userState.users.firstWhere(
                                (user) => user.uid == authState.uid,
                            orElse: () => const UserModel());
                        return HomeScreen(
                          userInfo: currentUserInfo,
                        );
                      }
                      return defaultLoader();
                    },
                  );
                }
                return Container();
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }
  Widget _bodyWidget() {
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
                  onPressed: _submitVerifyPhoneNumber,
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

  void _submitVerifyPhoneNumber() {
    if (_phoneNumberController.text.isNotEmpty) {
      setState(() {
        _phoneNumber="+$_countryCode${_phoneNumberController.text}";
      });
      BlocProvider.of<PhoneAuthCubit>(context).submitVerifyPhoneNumber(
        phoneNumber: _phoneNumber,
      );
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}

