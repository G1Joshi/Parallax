import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ParallaxHeader extends StatelessWidget {
  const ParallaxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(24.0),
      child: Column(
        children: [_buildTitle(), const SizedBox(height: 12), _buildSubtitle()],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppStrings.headerTitle,
      style: TextStyle(
        fontSize: AppDimensions.headerFontSize,
        fontWeight: .w900,
        color: AppColors.white,
        letterSpacing: 1.2,
        shadows: [
          Shadow(
            color: AppColors.purple.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      textAlign: .center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      AppStrings.headerSubtitle,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.white.withValues(alpha: 0.7),
        letterSpacing: 0.8,
      ),
    );
  }
}
