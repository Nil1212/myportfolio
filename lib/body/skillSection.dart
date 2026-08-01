import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  static const double _breakpoint = 878;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < _breakpoint;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 32 : 60,
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Experience',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Hi, I'm NIL, a Flutter developer with a deep love for creating apps that solve real-world problems. With 3 years of experience and expertise in technologies like Hive, Firebase, and REST APIs, I've built apps ranging from e-commerce solutions to travel guides. I thrive on turning creative ideas into functional, visually appealing apps that users love. In my free time, I enjoy traveling and drawing inspiration from new cultures for my projects. Let's connect and create something amazing!",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 5,
          child: _skillCard(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Experience',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Hi, I'm NIL, a Flutter developer with a deep love for creating apps that solve real-world problems. With 3 years of experience and expertise in technologies like Hive, Firebase, and REST APIs, I've built apps ranging from e-commerce solutions to travel guides. I thrive on turning creative ideas into functional, visually appealing apps that users love. In my free time, I enjoy traveling and drawing inspiration from new cultures for my projects. Let's connect and create something amazing!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 32),
        _skillCard(),
      ],
    );
  }

  Widget _skillCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'My Skill',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          _SkillBar(label: 'Mobile App Development', percent: 0.70, percentText: '70%'),
          const SizedBox(height: 28),
          _SkillBar(label: 'Web Static', percent: 0.90, percentText: '90%'),
          const SizedBox(height: 28),
          _SkillBar(label: 'Web Development', percent: 0.60, percentText: '60%'),
          const SizedBox(height: 28),
          _SkillBar(label: 'Web System', percent: 0.50, percentText: '50%'),
        ],
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String label;
  final double percent;
  final String percentText;

  const _SkillBar({
    required this.label,
    required this.percent,
    required this.percentText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1E2A3A)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              percentText,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}