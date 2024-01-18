import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappc/presentation/screens/homeScreen/call_screen.dart';
import 'package:whatsappc/presentation/screens/homeScreen/camera_screen.dart';
import 'package:whatsappc/presentation/screens/homeScreen/chat_screen.dart';
import 'package:whatsappc/presentation/screens/homeScreen/status_screen.dart';
import 'package:whatsappc/presentation/widgets/core_textField.dart';
import 'package:whatsappc/presentation/widgets/custom_tabBar.dart';
import 'package:whatsappc/utils/design_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> get _pages => [
    const CameraScreen(),
    const ChatScreen(),
    const StatusScreen(),
    const CallsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor: _isSearch == false ? primaryColor : transparent,
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarColor: _isSearch == false
              //       ? primaryColor
              //       : transparent, // Transparent status bar
              //   statusBarIconBrightness:
              //       _isSearch == false ? Brightness.light : Brightness.dark,
              // ),
              title: _isSearch == false
                  ? Text(whatsAppClone)
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
              flexibleSpace: _isSearch == false
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                    )
                  : _buildSearch(),
              actions:  <Widget>[
                _isSearch ? SizedBox(height: 0.0,width: 0.0,) : InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: Icon(Icons.search)),
                SizedBox(
                  width: 5,
                ),
                _isSearch ? SizedBox(height: 0.0,width: 0.0,) : InkWell(onTap: () {}, child: Icon(Icons.more_vert))
              ],
            )
          : null,
      body: Column(
        children: <Widget>[
          //TODO:CustomTabBar
          _isSearch == false
              ? _currentPageIndex != 0
              ? CustomTabBar(index: _currentPageIndex)
              : Container(height: 0.0, width: 0.0,)
              : Container(
            height: 0.0,
            width: 0.0,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }

  _buildSearch() {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: CoreTextField(
        isItSearchField: true,
        prefixIcon: InkWell(
          onTap: () {
            setState(() {
              _isSearch = false;
            });
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
      ),
      // child: TextField(
      //   decoration: InputDecoration(
      //     hintText: "Search...",
      //     prefixIcon: InkWell(
      //       onTap: () {
      //         //TODO:
      //         setState(() {
      //           _isSearch = false;
      //         });
      //       },
      //       child: Icon(Icons.arrow_back),
      //     ),
      //   ),
      // ),
    );
  }
}
