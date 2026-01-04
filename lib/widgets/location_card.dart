import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'parallax_flow_delegate.dart';

class LocationCard extends StatelessWidget {
  LocationCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
  });

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(
        horizontal: AppDimensions.cardHorizontalPadding,
        vertical: AppDimensions.cardVerticalPadding,
      ),
      child: _buildCardContainer(context),
    );
  }

  Widget _buildCardContainer(BuildContext context) {
    return Container(
      decoration: _buildCardDecoration(),
      child: AspectRatio(
        aspectRatio: AppDimensions.cardAspectRatio,
        child: ClipRRect(
          borderRadius: .circular(AppDimensions.cardBorderRadius),
          child: _buildCardBorder(context),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: .circular(AppDimensions.cardBorderRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.purple.withValues(alpha: 0.3),
          blurRadius: 30,
          spreadRadius: 5,
          offset: const Offset(0, 15),
        ),
        BoxShadow(
          color: AppColors.blue.withValues(alpha: 0.2),
          blurRadius: 60,
          spreadRadius: -10,
          offset: const Offset(0, 30),
        ),
      ],
    );
  }

  Widget _buildCardBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: .all(color: AppColors.white.withValues(alpha: 0.1), width: 2),
        borderRadius: .circular(AppDimensions.cardBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: .circular(AppDimensions.cardBorderRadius - 2),
        child: Stack(
          children: [
            _buildParallaxBackground(context),
            _buildGradientOverlay(),
            _buildLocationInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          imageUrl,
          key: _backgroundImageKey,
          fit: .cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: AppColors.darkBlue,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                  color: AppColors.white,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.darkBlue,
              child: const Center(
                child: Icon(Icons.error, color: AppColors.white, size: 48),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.black.withValues(alpha: 0.1),
              AppColors.black.withValues(alpha: 0.4),
              AppColors.black.withValues(alpha: 0.9),
            ],
            begin: .topCenter,
            end: .bottomCenter,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 24,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          _buildLocationBadge(),
          const SizedBox(height: 12),
          _buildLocationTitle(),
        ],
      ),
    );
  }

  Widget _buildLocationBadge() {
    return Container(
      padding: const .symmetric(
        horizontal: AppDimensions.badgePadding,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: .circular(20),
        border: .all(color: AppColors.white.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          const Icon(Icons.location_on, color: AppColors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            country,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: AppDimensions.subtitleFontSize,
              fontWeight: .w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationTitle() {
    return Text(
      name,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: AppDimensions.titleFontSize,
        fontWeight: .w900,
        letterSpacing: 1.0,
        height: 1.2,
        shadows: [
          Shadow(color: AppColors.black, blurRadius: 20, offset: Offset(0, 4)),
        ],
      ),
    );
  }
}
