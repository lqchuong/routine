import 'package:flutter/material.dart';
import 'package:routine_app/src/themes/light_color.dart';

class AppButton extends StatelessWidget {
  String title;
  double? height;
  double? width;
  void Function()? onPress;
  Color? backgroundColor;
  Color? textColor;
  double radius;
  bool isLoading;
  Icon icon;
  AppButton(
      {Key? key,
      required this.title,
      this.isLoading = false,
      required this.icon,
      this.height,
      this.width,
      this.onPress,
      this.backgroundColor = LightColor.primaryBackgroundButton,
      this.textColor = Colors.white,
      this.radius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
      elevation: 5.0,
      shadowColor: LightColor.backgroundColor,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton.icon(
          icon: isLoading
              ? Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(2.0),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : icon,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                // side: BorderSide(color: textColor!)
              ))),
          onPressed: isLoading ? null : onPress,
          label: Text(title,
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
