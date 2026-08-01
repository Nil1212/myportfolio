import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  static const double _breakpoint = 878;

  // Update these with your real profile links
  static const String _facebookUrl = 'https://facebook.com/nilvoeurn1204';
  static const String _tiktokUrl = 'https://tiktok.com/@codefluc';
  static const String _telegramUrl = 'https://t.me/voeurnnil';
  static const String _myEmail = 'codefluc15@gmail.com';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _openLink(String url) {
    html.window.open(url, '_blank');
  }

  void _sendMessage() {
  final name = _nameController.text.trim();
  final email = _emailController.text.trim();
  final message = _messageController.text.trim();

  if (name.isEmpty || email.isEmpty || message.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields')),
    );
    return;
  }

  final params = js.JsObject.jsify({
    'name': name,
    'email': email,
    'message': message,
    'title': 'Portfolio Contact',
  });

  final emailjs = js.context['emailjs'];
  emailjs.callMethod('send', [
    'service_6qv6m8q',   // your Service ID
    'template_uhpisng',  // replace with your Template ID
    params,
  ]).callMethod('then', [
    js.allowInterop((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message sent! I'll get back to you soon.")),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }),
    js.allowInterop((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send. Please try again.')),
      );
    }),
  ]);
}

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
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Have a project in mind? Let's talk about it.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          SizedBox(height: isMobile ? 28 : 40),
          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 4, child: _infoCard()),
          const SizedBox(width: 40),
          Expanded(flex: 6, child: _formCard(mobileFieldStack: false)),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _infoCard(),
        const SizedBox(height: 24),
        _formCard(mobileFieldStack: true),
      ],
    );
  }

  Widget _infoCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(28),
    decoration: BoxDecoration(
      color: const Color(0xFF1E2530),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Get in Touch',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "I'd love to hear from you. Reach out through any of these channels.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24), // reduced from 32
        _ContactInfoTile(
          icon: Icons.email_outlined,
          label: 'codefluc15@gmail.com',
        ),
        const SizedBox(height: 16), // reduced from 20
        _ContactInfoTile(
          icon: Icons.phone_outlined,
          label: '+855 977 836 463',
        ),
        const SizedBox(height: 6), // reduced from 20
        _ContactInfoTile(
          icon: Icons.location_on_outlined,
          label: 'Preah Netr Preah, BanteayMeanChey, Cambodia',
        ),
        const SizedBox(height: 10), // reduced from 28
        Row(
          children: [
            _SocialCircle(
              icon: Icons.facebook,
              onTap: () => _openLink(_facebookUrl),
            ),
            const SizedBox(width: 12),
            _SocialCircle(
              icon: Icons.music_note,
              onTap: () => _openLink(_tiktokUrl),
            ),
            const SizedBox(width: 12),
            _SocialCircle(
              icon: Icons.send,
              onTap: () => _openLink(_telegramUrl),
            ),
          ],
        ),
      ],
    ),
  );
}

  Widget _formCard({required bool mobileFieldStack}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          mobileFieldStack
              ? Column(
                  children: [
                    _ContactTextField(label: 'Name', controller: _nameController),
                    const SizedBox(height: 20),
                    _ContactTextField(label: 'Email', controller: _emailController),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _ContactTextField(
                        label: 'Name',
                        controller: _nameController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _ContactTextField(
                        label: 'Email',
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          _ContactTextField(
            label: 'Message',
            controller: _messageController,
            maxLines: 6,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E2530),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactInfoTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade300,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialCircle extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialCircle({required this.icon, required this.onTap});

  @override
  State<_SocialCircle> createState() => _SocialCircleState();
}

class _SocialCircleState extends State<_SocialCircle> {
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
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _isHovered ? const Color(0xFF3B82F6) : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? Colors.white : const Color(0xFF1E2530),
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const _ContactTextField({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 15, color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF1E2530), width: 1.5),
        ),
      ),
    );
  }
}