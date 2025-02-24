import 'package:flutter/material.dart';

enum BreakpointType { smallMobile, mobile, tablet, desktop }

abstract class BreakpointHelper {
  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static BreakpointType getBreakpointType(BuildContext context) {
    if (isSmallMobile(context)) {
      return BreakpointType.smallMobile;
    } else if (isMobile(context)) {
      return BreakpointType.mobile;
    } else if (isTablet(context)) {
      return BreakpointType.tablet;
    } else {
      return BreakpointType.desktop;
    }
  }

  static T? applyStylesIfMobile<T>(
    BuildContext context,
    T styles,
  ) {
    return isMobile(context) ? styles : null;
  }

  static T? applyStylesIfTablet<T>(
    BuildContext context,
    T styles,
  ) {
    return isTablet(context) ? styles : null;
  }

  static T? applyStylesIfDesktop<T>(
    BuildContext context,
    T styles,
  ) {
    return isDesktop(context) ? styles : null;
  }

  static T applyBreakpointStyles<T>(
    BuildContext context,
    T smallMobileStyles,
    T mobileStyles,
    T tabletStyles,
    T desktopStyles,
  ) {
    switch (getBreakpointType(context)) {
      case BreakpointType.smallMobile:
        print('small mobile');
        return smallMobileStyles;
      case BreakpointType.mobile:
        print('mobile');
        return mobileStyles;
      case BreakpointType.tablet:
        print('tablet');
        return tabletStyles;
      case BreakpointType.desktop:
        print('desktop');
        return desktopStyles;
    }
  }
}
