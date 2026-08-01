import 'package:flutter/material.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  static const double _mobileBreakpoint = 695;
  static const double _tabletBreakpoint = 1180;

  final List<Map<String, String>> services = const [
    {
      'image': 'assets/images/web_design.jpg',
      'title': 'Web Design',
      'description':
          'We create visually stunning, user-centric websites that represent your brand and engage your audience effectively',
    },
    {
      'image': 'assets/images/web_development.jpg',
      'title': 'Web Development',
      'description':
          'Our team builds dynamic, responsive websites using the latest technologies to ensure optimal performance across all devices.',
    },
    {
      'image': 'assets/images/mobile_app_development.png',
      'title': 'Mobile App Development',
      'description':
          'We design and develop custom mobile applications that provide seamless user experiences across iOS and Android platforms.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < _mobileBreakpoint;
    final isTablet = width >= _mobileBreakpoint && width < _tabletBreakpoint;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 32 : 60,
      ),
      child: Column(
        children: [
          Text(
            'My Services',
            style: TextStyle(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 28 : 40),
          if (isMobile)
            _buildMobileLayout()
          else if (isTablet)
            _buildGridLayout(context, columns: 2)
          else
            _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: services
            .map((service) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: _ServiceCard(
                      image: service['image']!,
                      title: service['title']!,
                      description: service['description']!,
                      imageHeight: 420,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  // Used for tablet (2 columns) - wraps to next row if needed
  Widget _buildGridLayout(BuildContext context, {required int columns}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 20.0;
        final cardWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: services
              .map((service) => SizedBox(
                    width: cardWidth,
                    child: _ServiceCard(
                      image: service['image']!,
                      title: service['title']!,
                      description: service['description']!,
                      imageHeight: 300,
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: services
          .map((service) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ServiceCard(
                  image: service['image']!,
                  title: service['title']!,
                  description: service['description']!,
                  imageHeight: 300,
                ),
              ))
          .toList(),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double imageHeight;

  const _ServiceCard({
    required this.image,
    required this.title,
    required this.description,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}