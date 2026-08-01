import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../animation/scroll_fade_in.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  // Same links as ContactSection
  static const String _facebookUrl = 'https://facebook.com/nilvoeurn1204';
  static const String _tiktokUrl = 'https://tiktok.com/@codefluc';
  static const String _telegramUrl = 'https://t.me/voeurnnil';
  static const String _myEmail = 'codefluc15@gmail.com';

  void _openLink(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1E2530),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ScrollFadeIn(
        uniqueKey: 'footer-section',
        child: Column(
          children: [
            const Text(
              'VOEURN Nil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '©CodeFluc',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 1,
                  height: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 12),
                Text(
                  _myEmail,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: 200,
              height: 1,
              color: Colors.grey.shade700,
            ),
            const SizedBox(height: 24),
            Text(
              'Preah Netr Preah , BanteayMeanChey, Cambodia',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(
                  icon: Icons.facebook,
                  onTap: () => _openLink(_facebookUrl),
                ),
                const SizedBox(width: 16),
                _SocialIcon(
                  icon: Icons.tiktok,
                  onTap: () => _openLink(_tiktokUrl),
                ),
                const SizedBox(width: 16),
                _SocialIcon(
                  icon: Icons.send,
                  onTap: () => _openLink(_telegramUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isHovered ? const Color(0xFF3B82F6) : Colors.white,
              shape: BoxShape.circle,
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withOpacity(0.4),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? Colors.white : const Color(0xFF1E2530),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}