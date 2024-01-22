import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappc/data/models/user_model.dart';
import 'package:whatsappc/presentation/bloc/auth/auth_cubit.dart';
import 'package:whatsappc/presentation/bloc/communication/communication_cubit.dart';
import 'package:whatsappc/presentation/bloc/getDeviceNumber/get_device_numbers_cubit.dart';
import 'package:whatsappc/presentation/bloc/myChat/my_chat_cubit.dart';
import 'package:whatsappc/presentation/bloc/phoneAuth/phone_auth_cubit.dart';
import 'package:whatsappc/presentation/bloc/user/user_cubit.dart';
import 'package:whatsappc/presentation/screens/homeScreen/home_screen.dart';
import 'package:whatsappc/presentation/startupScreens/splash_screen.dart';
import 'package:whatsappc/presentation/startupScreens/welcome_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:whatsappc/utils/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<PhoneAuthCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>()..getAllUsers(),
        ),
        BlocProvider<GetDeviceNumbersCubit>(
          create: (_) => di.sl<GetDeviceNumbersCubit>(),
        ),
        BlocProvider<CommunicationCubit>(
          create: (_) => di.sl<CommunicationCubit>(),
        ),
        BlocProvider<MyChatCubit>(
          create: (_) => di.sl<MyChatCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: whatsAppClone,
        theme: appTheme,
        routes: {
          "/": (context) {
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
                      return Container();
                    },
                  );
                }
                if (authState is UnAuthenticated) {
                  return const WelcomeScreen();
                }
                return Container();
              },
            );
          }
        },
      ),

    );
  }
}

