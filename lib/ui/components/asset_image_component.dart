import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssetImageComponent extends StatelessWidget{
  final String image;
  final double ?width;
  final double ?height;
  final BoxFit ?fit;
  const AssetImageComponent({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,height: height,width: width,fit: fit,);
  }

}