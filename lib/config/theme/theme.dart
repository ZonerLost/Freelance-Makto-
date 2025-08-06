import 'package:flutter/material.dart';

import '../constant/colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kWhiteColor,

      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }
}
