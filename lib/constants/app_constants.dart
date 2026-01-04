import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
  static const Color deepPurple = Color.fromARGB(255, 25, 15, 45);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color purple = Colors.purple;
  static const Color blue = Colors.blue;
}

class AppDimensions {
  static const double cardBorderRadius = 24.0;
  static const double cardHorizontalPadding = 24.0;
  static const double cardVerticalPadding = 20.0;
  static const double cardAspectRatio = 16 / 9;
  static const double titleFontSize = 28.0;
  static const double subtitleFontSize = 12.0;
  static const double headerFontSize = 32.0;
  static const double badgePadding = 12.0;
}

class AppStrings {
  static const String appTitle = 'Parallax Explorer';
  static const String headerTitle = 'Discover Amazing Places';
  static const String headerSubtitle = 'Scroll to experience the depth';
}

class ImageConfig {
  static const String unsplashBaseUrl = 'https://images.unsplash.com';
  static const String imageParams = 'w=1920&q=80';

  static String getImageUrl(String photoId) {
    return '$unsplashBaseUrl/photo-$photoId?$imageParams';
  }
}
