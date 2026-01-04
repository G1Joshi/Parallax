import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/location_data.dart';
import '../widgets/location_card.dart';
import '../widgets/parallax_header.dart';

class ParallaxHome extends StatelessWidget {
  const ParallaxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_buildBackgroundGradient(), _buildScrollableContent()],
      ),
    );
  }

  Widget _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: .topLeft,
          end: .bottomRight,
          colors: [AppColors.darkBlue, AppColors.deepPurple, AppColors.black],
        ),
      ),
    );
  }

  Widget _buildScrollableContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const ParallaxHeader(),
            const SizedBox(height: 20),
            ...LocationData.locations.map(
              (location) => LocationCard(
                imageUrl: location.imageUrl,
                name: location.name,
                country: location.place,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
