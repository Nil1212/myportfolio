import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillTap;
  final VoidCallback onContactTap;
  final VoidCallback onServiceTap;

  const NavDrawer({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillTap,
    required this.onContactTap,
    required this.onServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'CodeFluc',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const Divider(),
            _drawerItem(context, 'Home', onHomeTap),
            _drawerItem(context, 'About', onAboutTap),
            _drawerItem(context, 'Skill', onSkillTap),
            _drawerItem(context, 'Contact', onContactTap),
            _drawerItem(context, 'Service', onServiceTap),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String label, VoidCallback onTap) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
      onTap: () {
        Navigator.of(context).pop(); // close drawer
        onTap(); // then scroll to section
      },
    );
  }
}