import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/screens/homeScreen/subScreen/singleItemStory_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';
class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  final int length = 15;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _storyWidget(),
            const SizedBox(height: 8,),
            _recentTextWidget(),
            const SizedBox(height: 8,),
            _listStories(),
            const SizedBox(height: 10,),
            Text(yourStatusListEndHere,style: AppTextTheme.text16,),
            const SizedBox(height: 50,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _storyWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 4),
      child: Row(
        children: <Widget>[
          Container(
            height: 55,
            width: 55,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: imageFromAsset(
                    height: 50,
                    width: 50,
                    imagePath: AppImages.profileDefault,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My Status",
                style: AppTextTheme.text18,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Tap to add status update",
                style: AppTextTheme.text14,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recentTextWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
          color: Colors.grey[200]
      ),
      child: Text(recentUpdates,style: AppTextTheme.text14,),
    );
  }

  Widget _listStories() {
    return ListView.builder(
      itemCount: length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const Column(
          children: <Widget> [
           SizedBox(height: 10,),
            SingleItemStoryScreen(time: "10:00 am",name: "Rashaduzzaman Ananda",recentSendMessage: "Hi, I am using this app."),

          ],
        );
      },
    );
  }
}