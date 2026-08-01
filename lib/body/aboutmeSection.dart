import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const double _breakpoint = 668;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < _breakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 24 : 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: ClipRRect(
            child: Image.asset(
              'assets/images/about_me.jpg',
              fit: BoxFit.fitHeight,
              height: 500,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Hi, I'm Nil, a recent Information Technology graduate with a passion for software development and creating meaningful digital solutions. I enjoy learning new technologies, solving real-world problems, and turning ideas into practical applications. Through academic and personal projects, I've developed strong problem-solving, teamwork, and adaptability skills. I'm eager to begin my professional career, continue growing as a developer, and contribute to projects that make a positive impact.",
                  textAlign: TextAlign.left,
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
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            'assets/images/about_me.jpg',
            fit: BoxFit.cover,
            height: 260,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'About Me',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Hi, I'm Nil, a recent Information Technology graduate with a passion for software development and creating meaningful digital solutions. I enjoy learning new technologies, solving real-world problems, and turning ideas into practical applications. Through academic and personal projects, I've developed strong problem-solving, teamwork, and adaptability skills. I'm eager to begin my professional career, continue growing as a developer, and contribute to projects that make a positive impact.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}