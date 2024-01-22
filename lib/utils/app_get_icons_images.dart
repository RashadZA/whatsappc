part of 'design_utils.dart';

Widget imageFromAsset({
  double? height,
  double? width,
  BoxFit? fit,
  required String imagePath,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: Image.asset(
      imagePath,
      fit: fit ?? BoxFit.fill,
    ),
  );
}

Widget imageFromAssetWithClipRRect({
  double? height,
  double? width,
  double? circularRadius,
  String? imagePath,
}) {
  return SizedBox(
    height: height ?? 60,
    width: width ?? 60,
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(circularRadius ?? 25),
      ),
      child: Image.asset(
        imagePath ?? AppImages.profileDefault,
        fit: BoxFit.fill,
      ),
    ),
  );
}
