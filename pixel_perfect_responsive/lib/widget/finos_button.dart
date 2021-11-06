import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinOSButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color colorBackground;
  final Color colorBorder;
  final Color? colorTitleButton;
  final double height;
  final double width;
  final double fonSize;
  final double cornerRadius;
  final Color colorBackgroundDisable;
  final Color colorBorderDisable;
  final Color colorTitleDisable;
  final Color colorIcons;
  final Color colorIconsDisable;
  final VoidCallback onPressed;
  final String? packageName;
  bool isActive;

  FinOSButton(
      {Key? key,
      required this.text,
      this.iconPath = "",
      required this.colorBackground,
      this.colorTitleButton,
      required this.onPressed,
      this.colorBorder = Colors.transparent,
      this.width = 200,
      this.height = 48,
      this.fonSize = 16,
      this.cornerRadius = 30,
      this.colorBackgroundDisable = Colors.grey,
      this.colorBorderDisable = Colors.transparent,
      this.colorTitleDisable = Colors.white,
      this.colorIcons = Colors.white,
      this.colorIconsDisable = Colors.white,
      this.packageName,
      this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (isActive) ? onPressed : null,
        style: _buildStyleButton(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton(),
            SizedBox(
              width: iconPath.isEmpty ? 0 : 10,
            ),
            Text(
              text,
              style: _buildStyleTitle(),
            ),
          ],
        ));
  }

  TextStyle _buildStyleTitle() {
    return TextStyle(
        fontSize: fonSize,
        color:
            (isActive) ? colorTitleButton ?? Colors.white : colorTitleDisable,
        fontWeight: FontWeight.w500);
  }

  ButtonStyle _buildStyleButton() {
    return ElevatedButton.styleFrom(
        primary: (isActive) ? colorBackground : colorBackgroundDisable,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.0,
            color: (isActive) ? colorBorder : colorBorderDisable,
          ),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        minimumSize: Size(width, height));
  }

  Widget _buildIconButton() {
    return (iconPath.isNotEmpty)
        ? SvgPicture.asset(
            iconPath,
            package: packageName,
            color: (isActive) ? colorIcons : colorIconsDisable,
          )
        : const SizedBox();
  }
}
