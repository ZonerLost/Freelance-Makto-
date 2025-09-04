import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final TextStyle? textStyle;
  final TextStyle? readMoreStyle;

  ReadMoreText({
    super.key,
    required this.text,
    this.trimLines = 2,
    this.textStyle,
    this.readMoreStyle,
  });

  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = textStyle ??
        const TextStyle(
          color: Color(0xFF767676),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.71,
        );

    final defaultReadMoreStyle = readMoreStyle ??
        const TextStyle(
          color: Color(0xFF226399),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.71,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Measure text overflow
        final span = TextSpan(text: text, style: defaultTextStyle);
        final tp = TextPainter(
          text: span,
          maxLines: trimLines,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Obx(
              () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: defaultTextStyle,
                maxLines: isExpanded.value ? null : trimLines,
                overflow:
                isExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              if (isOverflowing)
                GestureDetector(
                  onTap: () => isExpanded.toggle(),
                  child: Text(
                    isExpanded.value ? " Read less" : " Read more...",
                    style: defaultReadMoreStyle,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}



class SeeMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final TextStyle? textStyle;
  final TextStyle? readMoreStyle;

  SeeMoreText({
    super.key,
    required this.text,
    this.trimLines = 2,
    this.textStyle,
    this.readMoreStyle,
  });

  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = textStyle ??
        const TextStyle(
          color: Color(0xFF767676),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.71,
        );

    final defaultReadMoreStyle = readMoreStyle ??
        const TextStyle(
          color: Color(0xFF226399),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.71,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Measure text overflow
        final span = TextSpan(text: text, style: defaultTextStyle);
        final tp = TextPainter(
          text: span,
          maxLines: trimLines,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Obx(
              () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: defaultTextStyle,
                maxLines: isExpanded.value ? null : trimLines,
                overflow:
                isExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              if (isOverflowing)
                GestureDetector(
                  onTap: () => isExpanded.toggle(),
                  child: Text(
                    isExpanded.value ? " See less" : " See more...",
                    style: defaultReadMoreStyle,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
