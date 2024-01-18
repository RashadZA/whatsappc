import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleItemChat_screnn.dart';
import 'package:whatsappc/utils/design_utils.dart';

class ChatScreen extends StatelessWidget {
   const ChatScreen({super.key});

  final int length = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget> [
                    index == 0 ? const SizedBox(height: 10,) : const SizedBox(height: 0,width: 0,),
                    const SingleItemChatUserPage(time: "10:00 am",name: "Ananda",recentSendMessage: "This is test"),
                    const SizedBox(height: 10,),
                    index + 1 ==  length ? Text(yourChatListEndHere,style: AppTextTheme.text16,) : const SizedBox(height: 0.0,width: 0.0,),
                    index + 1 ==  length ? const SizedBox(height: 50,) : const SizedBox(height: 0.0,width: 0.0,),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => SelectContactPage(
          //           userInfo: widget.userInfo,
          //         ),),);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
// class ChatPage extends StatefulWidget {
//   final UserEntity userInfo;
//
//   const ChatPage({Key key, this.userInfo}) : super(key: key);
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   void initState() {
//     BlocProvider.of<MyChatCubit>(context).getMyChat(uid: widget.userInfo.uid);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<MyChatCubit, MyChatState>(
//         builder: (_, myChatState) {
//           if (myChatState is MyChatLoaded) {
//             return _myChatList(myChatState);
//           }
//           return _loadingWidget();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) => SelectContactPage(
//                     userInfo: widget.userInfo,
//                   )));
//         },
//         child: Icon(Icons.chat),
//       ),
//     );
//   }
//
//   Widget _emptyListDisplayMessageWidget() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             color: greenColor.withOpacity(.5),
//             borderRadius: BorderRadius.all(Radius.circular(100)),
//           ),
//           child: Icon(
//             Icons.message,
//             color: Colors.white.withOpacity(.6),
//             size: 40,
//           ),
//         ),
//         Align(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Text(
//               "Start chat with your friends and family,\n on WhatsApp Clone",
//               textAlign: TextAlign.center,
//               style:
//               TextStyle(fontSize: 14, color: Colors.black.withOpacity(.4)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _myChatList(MyChatLoaded myChatData) {
//     return myChatData.myChat.isEmpty
//         ? _emptyListDisplayMessageWidget()
//         : ListView.builder(
//       itemCount: myChatData.myChat.length,
//       itemBuilder: (_, index) {
//         final myChat=myChatData.myChat[index];
//         return InkWell(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(
//               builder: (_) => SingleCommunicationPage(
//                 senderPhoneNumber: myChat.senderPhoneNumber,
//                 senderUID: widget.userInfo.uid,
//                 senderName: myChat.senderName,
//                 recipientUID: myChat.recipientUID,
//                 recipientPhoneNumber: myChat.recipientPhoneNumber,
//                 recipientName: myChat.recipientName,
//               ),
//             ));
//           },
//           child: SingleItemChatUserPage(
//             name: myChat.recipientName,
//             recentSendMessage: myChat.recentTextMessage,
//             time: DateFormat('hh:mm a').format(myChat.time.toDate()),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _loadingWidget() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }
