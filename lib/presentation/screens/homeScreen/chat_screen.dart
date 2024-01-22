import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsappc/domain/entities/user_entity.dart';
import 'package:whatsappc/presentation/bloc/myChat/my_chat_cubit.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/selectContact_screen.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleCommunication_screen.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleItemChatUser_screnn.dart';
import 'package:whatsappc/utils/design_utils.dart';

class ChatScreen extends StatefulWidget {
  final UserEntity userInfo;
  const ChatScreen({super.key, required this.userInfo});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final int length = 15;

  @override
  void initState() {
    BlocProvider.of<MyChatCubit>(context).getMyChat(uid: widget.userInfo.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyChatCubit, MyChatState>(
        builder: (_, myChatState) {
          if (myChatState is MyChatLoaded) {
            return _myChatList(myChatState);
          }
          return _loadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () async {
          debugPrint("UserInfo: ${widget.userInfo}");
          if (await Permission.contacts.request().isGranted) {
            // Permission is granted
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SelectContactScreen(
                  userInfo: widget.userInfo,
                ),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: AlertDialog(
                  contentPadding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  content: Container(
                    height: 250,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: whiteColor),
                    child: Center(
                      child: Text(
                        "Permition Required",
                        style: AppTextTheme.text18,
                      ),
                    ),
                  ),
                ),
              ),
            );
            // Permission is not granted
            // You can show a dialog or message to inform the user and ask for permission again.
          }
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget _emptyListDisplayMessageWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: greenColor.withOpacity(.5),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Icon(
            Icons.message,
            color: Colors.white.withOpacity(.6),
            size: 40,
          ),
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Start chat with your friends and family,\n on WhatsApp Clone",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(.4)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _myChatList(MyChatLoaded myChatData) {
    return myChatData.myChat.isEmpty
        ? _emptyListDisplayMessageWidget()
        : ListView.builder(
            itemCount: myChatData.myChat.length,
            itemBuilder: (_, index) {
              final myChat = myChatData.myChat[index];
              return Column(
                children: <Widget>[
                  index == 0
                      ? const SizedBox(
                          height: 10,
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SingleCommunicationScreen(
                              senderPhoneNumber: myChat.senderPhoneNumber,
                              senderUID: widget.userInfo.uid,
                              senderName: myChat.senderName,
                              recipientUID: myChat.recipientUID,
                              recipientPhoneNumber: myChat.recipientPhoneNumber,
                              recipientName: myChat.recipientName,
                            ),
                          ));
                    },
                    child: SingleItemChatUserScreen(
                      name: myChat.recipientName,
                      recentSendMessage: myChat.recentTextMessage,
                      time: DateFormat('hh:mm a').format(
                        myChat.time.toDate(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  index + 1 == length
                      ? Text(
                          yourChatListEndHere,
                          style: AppTextTheme.text16,
                        )
                      : const SizedBox(
                          height: 0.0,
                          width: 0.0,
                        ),
                  index + 1 == length
                      ? const SizedBox(
                          height: 50,
                        )
                      : const SizedBox(
                          height: 0.0,
                          width: 0.0,
                        ),
                ],
              );
            },
          );
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
