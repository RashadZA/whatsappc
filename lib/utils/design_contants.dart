part of 'design_utils.dart';

Widget defaultLoader({Color? color}) =>
    Center(child: CupertinoActivityIndicator(color: color ?? primaryColor));