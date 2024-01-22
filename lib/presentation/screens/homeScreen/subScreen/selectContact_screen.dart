import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappc/domain/entities/contact_entity.dart';
import 'package:whatsappc/domain/entities/user_entity.dart';
import 'package:whatsappc/presentation/bloc/getDeviceNumber/get_device_numbers_cubit.dart';
import 'package:whatsappc/presentation/bloc/user/user_cubit.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleCommunication_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectContactScreen extends StatefulWidget {
  final UserEntity userInfo;

  const SelectContactScreen({super.key, required this.userInfo});

  @override
  _SelectContactScreenState createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  @override
  void initState() {
    onInitState();
    super.initState();
  }

  void onInitState() {
    BlocProvider.of<GetDeviceNumbersCubit>(context).getDeviceNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeviceNumbersCubit, GetDeviceNumbersState>(
      builder: (context, contactNumberState) {
        if (contactNumberState is GetDeviceNumbersLoaded) {
          return BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              if (userState is UserLoaded) {
                final List<ContactEntity> contacts = [];
                final dbUsers = userState.users
                    .where((user) => user.uid != widget.userInfo.uid)
                    .toList();
                debugPrint("dbUsers List : $dbUsers");
                  debugPrint("contactNumberState.contacts : ${contactNumberState.contacts}");
                  for (var dbUser in dbUsers) {
                    debugPrint("PhoneNumber : ${dbUser.phoneNumber}");

                      contacts.add(ContactEntity(
                        label: dbUser.name,
                        phoneNumber: dbUser.phoneNumber,
                        uid: dbUser.uid,
                        status: dbUser.status,
                      ));

                }
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: primaryColor,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Select Contact"),
                        Text(
                          "${contacts.length} contacts",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    actions: const [
                      Icon(Icons.search),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  body: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        _newGroupButtonWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        _newContactButtonWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        _listContact(contacts),
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                backgroundColor: whiteColor,
                body: defaultLoader(),
              );
            },
          );
        }
        return Scaffold(
          backgroundColor: whiteColor,
          body: defaultLoader(),
        );
      },
    );
  }

  Widget _newGroupButtonWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: const Icon(
              Icons.people,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            "New Group",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newContactButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: const Icon(
                Icons.person_add,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "New contact",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Icon(
          FontAwesomeIcons.qrcode,
          color: greenColor,
        )
      ],
    );
  }

  Widget _listContact(List<ContactEntity> contacts) {
    return Expanded(
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SingleCommunicationScreen(
                            recipientName: contacts[index].label,
                            recipientPhoneNumber: contacts[index].phoneNumber,
                            recipientUID: contacts[index].uid,
                            senderName: widget.userInfo.name,
                            senderUID: widget.userInfo.uid,
                            senderPhoneNumber: widget.userInfo.phoneNumber,
                          )));
              BlocProvider.of<UserCubit>(context).createChatChannel(
                  uid: widget.userInfo.uid, otherUid: contacts[index].uid);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      imageFromAssetWithClipRRect(height: 55,width: 55,circularRadius: 50),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${contacts[index].label}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Hey there! I am Using WhatsApp Clone.",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
