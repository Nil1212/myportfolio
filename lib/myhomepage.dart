import 'package:flutter/material.dart';

import 'animation/scroll_fade_in.dart';
import 'appbar.dart';
import 'body/Herosection.dart';
import 'body/aboutmeSection.dart';
import 'body/contactSection.dart';
import 'body/serviceSection.dart';
import 'body/skillSection.dart';
import 'footer/fotterSection.dart';
import 'widget/nav_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _serviceKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLogoTap: _scrollToTop,
        onHomeTap: () => _scrollTo(_homeKey),
        onAboutTap: () => _scrollTo(_aboutKey),
        onSkillTap: () => _scrollTo(_skillKey),
        onContactTap: () => _scrollTo(_contactKey),
        onServiceTap: () => _scrollTo(_serviceKey),
      ),
      endDrawer: NavDrawer(
    onHomeTap: () => _scrollTo(_homeKey),
    onAboutTap: () => _scrollTo(_aboutKey),
    onSkillTap: () => _scrollTo(_skillKey),
    onContactTap: () => _scrollTo(_contactKey),
    onServiceTap: () => _scrollTo(_serviceKey),
  ),
      body:SingleChildScrollView(
  controller: _scrollController,
  child: Column(
    children: [
      KeyedSubtree(key: _homeKey, child: const HeroSection()),
      KeyedSubtree(
        key: _aboutKey,
        child: const ScrollFadeIn(
          uniqueKey: 'about-section',
          child: AboutSection(),
        ),
      ),
      KeyedSubtree(
        key: _skillKey,
        child: const ScrollFadeIn(
          uniqueKey: 'skill-section',
          child: SkillSection(),
        ),
      ),
      KeyedSubtree(
        key: _contactKey,
        child: const ScrollFadeIn(
          uniqueKey: 'contact-section',
          child: ContactSection(),
        ),
      ),
      KeyedSubtree(
        key: _serviceKey,
        child: const ScrollFadeIn(
          uniqueKey: 'service-section',
          child: ServiceSection(),
        ),
      ),
      
      const FooterSection(),
    ],
  ),
),
    );
  }
}