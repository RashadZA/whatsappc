part of 'design_utils.dart';

Widget imageFromAsset({
  required double height,
  required double width,
  required String imagePath,
}){

  return SizedBox(
    height: height,
    width: width,
    child: Image.asset(imagePath,fit: BoxFit.fill,),
  );
}