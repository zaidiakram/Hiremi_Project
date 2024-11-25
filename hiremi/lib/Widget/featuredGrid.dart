import 'package:flutter/material.dart';
import '../constants/constantText.dart';
import '../constants/constantsColor.dart';
import '../constants/constantsImage.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final titleSize = size.width * 0.045;
    final padding = size.width * 0.04;

    final featuredKeys = FeaturedText.featuredItems.keys.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: padding, bottom: padding * 0.5),
          child: Text(
            FeaturedText.featuredSectionTitle,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
          itemCount: featuredKeys.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.0,
            mainAxisSpacing: padding * 0.75,
            crossAxisSpacing: padding * 0.75,
          ),
          itemBuilder: (context, index) {
            final key = featuredKeys[index];
            return FeatureCard(
              title: FeaturedText.getTitle(key),
              subtitle: FeaturedText.getSubtitle(key),
              imagePath: _getImagePath(key),
              gradientColors: AppColors.gradients[key]!,
              onTap: () => Navigator.pushNamed(context, '/$key'),
            );
          },
        ),
      ],
    );
  }

  String _getImagePath(String key) {
    switch (key) {
      case 'askExpert':
        return AppImages.askExpert;
      case 'internship':
        return AppImages.internship;
      case 'status':
        return AppImages.status;
      case 'freshers':
        return AppImages.freshers;
      case 'hiremi360':
        return AppImages.hiremi360;
      case 'experience':
        return AppImages.experience;
      default:
        return '';
    }
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final titleSize = size.width * 0.032;
    final subtitleSize = size.width * 0.025;
    final imageHeight = size.width * 0.18;
    final padding = size.width * 0.04;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size.width * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            stops: const [0.4, 0.8, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.03),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: titleSize,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: size.width * 0.01),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.grey[700],
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                imagePath,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
