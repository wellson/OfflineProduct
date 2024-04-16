import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: title != null ? true : false,
      child: AutoSizeText(
        title ?? '',
        maxLines: 2,
        minFontSize: 10,
        wrapWords: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? Colors.grey.shade800,
        ),
      ),
    );
  }
}
