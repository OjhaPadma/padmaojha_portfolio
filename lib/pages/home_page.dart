import 'package:flutter/material.dart';

import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/common/app_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _menuOpen = false;

  late final List<NavItem> _navItems = [
    NavItem(label: 'About', keyRef: _aboutKey),
    NavItem(label: 'Skills', keyRef: _skillsKey),
    NavItem(label: 'Projects', keyRef: _projectsKey),
    NavItem(label: 'Experience', keyRef: _experienceKey),
    NavItem(label: 'Contact', keyRef: _contactKey),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    setState(() => _menuOpen = false);
    final context = key.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(
            items: _navItems,
            menuOpen: _menuOpen,
            onMenuToggle: () => setState(() => _menuOpen = !_menuOpen),
            onItemSelected: _scrollTo,
          ),
          Expanded(
            child: SelectionArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    KeyedSubtree(
                      key: _aboutKey,
                      child: HeroSection(
                        onContact: () => _scrollTo(_contactKey),
                      ),
                    ),
                    KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
                    KeyedSubtree(
                      key: _projectsKey,
                      child: const ProjectsSection(),
                    ),
                    KeyedSubtree(
                      key: _experienceKey,
                      child: const ExperienceSection(),
                    ),
                    const EducationSection(),
                    KeyedSubtree(
                      key: _contactKey,
                      child: const ContactSection(),
                    ),
                    const FooterSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
