import 'package:flutter/material.dart';

import '../constants/app_breakpoints.dart';

enum AppSizeClass { mobile, tablet, desktop }

abstract final class Responsive {
  static AppSizeClass ofWidth(double width) {
    if (width < AppBreakpoints.mobile) return AppSizeClass.mobile;
    if (width < AppBreakpoints.tablet) return AppSizeClass.tablet;
    return AppSizeClass.desktop;
  }

  static AppSizeClass of(BuildContext context) {
    return ofWidth(MediaQuery.sizeOf(context).width);
  }

  static bool isMobile(BuildContext context) =>
      of(context) == AppSizeClass.mobile;
}
