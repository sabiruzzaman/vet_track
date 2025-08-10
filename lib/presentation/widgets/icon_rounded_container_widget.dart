import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants/colors.dart';

class IconRoundedContainerWidget extends StatelessWidget {
  final String svgAsset;
  final double height;
  final double? width; // ✅ make optional
  final double iconSize;
  final VoidCallback? onTap;

  const IconRoundedContainerWidget({
    super.key,
    required this.svgAsset,
    this.height = 40,
    this.width,
    this.iconSize = 24,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: height,
      width: width, // ✅ allow Row to control width when it's null
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryGreen, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: SvgPicture.asset(
            svgAsset,
            width: iconSize,
            height: iconSize,
          ),
        ),
      ),
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: container)
        : container;
  }
}

