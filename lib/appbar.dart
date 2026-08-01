import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillTap;
  final VoidCallback onContactTap;
  final VoidCallback onServiceTap;

  const CustomAppBar({
    super.key,
    required this.onLogoTap,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillTap,
    required this.onContactTap,
    required this.onServiceTap,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  static const double _breakpoint = 878;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedText(Widget child) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: child),
    );
  }

  @override
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final isMobile = width < _breakpoint;

  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          spreadRadius: 0,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
    child: Row(
      children: [
        _animatedText(
          InkWell(
            onTap: widget.onLogoTap,
            child: Text(
              'CodeFluc',
              style: GoogleFonts.bubblegumSans(
                fontSize: isMobile ? 22 : 26,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const Spacer(),
        if (isMobile)
          _animatedText(
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          )
        else ...[
          _animatedText(_navItem('Home', widget.onHomeTap)),
          _animatedText(_navItem('About', widget.onAboutTap)),
          _animatedText(_navItem('Skill', widget.onSkillTap)),
          _animatedText(_navItem('Contact', widget.onContactTap)),
          _animatedText(_navItem('Service', widget.onServiceTap)),
          const SizedBox(width: 50),
        ],
      ],
    ),
  );
}

  Widget _navItem(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}