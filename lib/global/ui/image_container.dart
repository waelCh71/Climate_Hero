import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({
    super.key,
    required this.imageUrl,
    required this.width,
    this.margin,
    this.padding,
    this.child,
    required this.height,
    required this.borderRadius
  });

  final String imageUrl;
  double height = 125;
  final double width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
   double borderRadius = 20;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)),
      child: child,
    );
  }
}
