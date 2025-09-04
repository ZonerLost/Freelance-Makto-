import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:svg_flutter/svg.dart';

import '../../../config/constant/colors.dart';

class CommonImageView extends StatelessWidget {
  final String? url;
  final String? imagePath;
  final String? svgPath;
  final File? file;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit fit;
  final String placeHolder;

  const CommonImageView({
    super.key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.radius = 0.0,
    this.fit = BoxFit.cover,
    this.placeHolder = 'assets/images/no_image_found.png',
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_isValid(svgPath)) {
      imageWidget = SvgPicture.asset(
        svgPath!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (file != null && file!.existsSync()) {
      imageWidget = Image.file(file!, height: height, width: width, fit: fit);
    } else if (_isValid(url)) {
      imageWidget = CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        placeholder: (_, __) => _loadingIndicator(),
        errorWidget: (_, __, ___) => _errorImage(),
      );
    } else if (_isValid(imagePath)) {
      imageWidget = Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      imageWidget = _errorImage();
    }

    return Animate(
      effects: [FadeEffect(duration: const Duration(milliseconds: 500))],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: imageWidget,
      ),
    );
  }

  bool _isValid(String? path) => path != null && path.isNotEmpty;

  Widget _loadingIndicator() => SizedBox(
    height: 23,
    width: 23,
    child: Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: kPrimaryColor,
          backgroundColor: Colors.grey.shade100,
          strokeWidth: 2,
        ),
      ),
    ),
  );

  Widget _errorImage() =>
      Image.asset(placeHolder, height: height, width: width, fit: fit);
}
