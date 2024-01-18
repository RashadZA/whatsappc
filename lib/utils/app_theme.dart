part of 'design_utils.dart';



   const double defaultIconSize = 24;

   const double defaultElevation = 2;

   const double appBarHeight = 50;

   final appTheme = ThemeData().copyWith(
    useMaterial3: true,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    splashColor: transparent,
     dividerColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    hintColor: Colors.grey.shade600,
    iconTheme: const IconThemeData(size: defaultIconSize),
    appBarTheme: AppBarTheme(
      systemOverlayStyle:  const SystemUiOverlayStyle(
        statusBarColor: transparent, // Transparent status bar
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: defaultElevation,
      toolbarHeight: appBarHeight,
      titleTextStyle: AppTextTheme.text18
          .copyWith(color:whiteColor, fontWeight: FontWeight.w600),
      backgroundColor: transparent,
      actionsIconTheme: const IconThemeData(
        size: defaultIconSize,
        color: whiteColor
      ),
    ),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: whiteColor),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: transparent,
      scaffoldBackgroundColor: lightPrimaryColor,
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextTheme.text14
            .copyWith(color: blackColor, fontWeight: FontWeight.w600),
        primaryColor: primaryColor,
      ),
    ),
  );

