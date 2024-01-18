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
Widget imageFromAssetWithClipRRect({
   double? height,
   double? width,
   double? circularRadius,
   String? imagePath,
}){

  return SizedBox(
    height: height ?? 60,
    width: width ?? 60,

    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(circularRadius ?? 25),),
      child: Image.asset(imagePath ?? AppImages.profileDefault,fit: BoxFit.fill,),
    ),
  );
}
