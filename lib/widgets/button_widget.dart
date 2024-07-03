import 'package:base_uncia/constants/colors.dart';
import 'package:base_uncia/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonButton extends StatelessWidget{

  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color borderColor;
  final bool isOutLine;
  final TextStyle? textStyle;
  final Function(bool value)? onHover;
  final VoidCallback? longPress;
  final List<BoxShadow>? boxShadow;

  const CommonButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.background,
    this.borderColor = AppColor.borderColor,
    this.isOutLine = false,
    this.textStyle,
    this.onHover,
    this.longPress,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: AppColor.buttonWithOpacity.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        onHover:onHover!=null ? (hover)=>  onHover!.call(hover) : null,
        onLongPress: longPress!=null ? ()=> longPress!() : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
            side:  BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
        ),
        child: Text(buttonText,style: textStyle ?? AppTextStyle.button),
      ),
    );
  }

}