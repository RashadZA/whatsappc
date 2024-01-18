import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleItemCall_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const SingleItemCallScreen();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add_call,color: Colors.white,),
      ),
    );
  }
}
