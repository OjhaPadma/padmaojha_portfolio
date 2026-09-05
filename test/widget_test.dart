import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:padmaojha_portfolio/data/models/project.dart';
import 'package:padmaojha_portfolio/sections/projects_section.dart';
import 'package:padmaojha_portfolio/widgets/common/app_nav_bar.dart';

void main() {
  testWidgets('nav bar shows section links', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final about = GlobalKey();
    final skills = GlobalKey();
    final projects = GlobalKey();
    final experience = GlobalKey();
    final contact = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppNavBar(
            items: [
              NavItem(label: 'About', keyRef: about),
              NavItem(label: 'Skills', keyRef: skills),
              NavItem(label: 'Projects', keyRef: projects),
              NavItem(label: 'Experience', keyRef: experience),
              NavItem(label: 'Contact', keyRef: contact),
            ],
            menuOpen: false,
            onMenuToggle: () {},
            onItemSelected: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('About'), findsOneWidget);
    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Experience'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
    expect(find.text('Padma Ojha'), findsOneWidget);
  });

  testWidgets('project card opens details dialog', (tester) async {
    const project = Project(
      name: 'Test App',
      tagline: 'A sample tagline',
      platformLabel: 'Flutter',
      description: 'Detailed description',
      tech: ['Dart', 'Flutter'],
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: ProjectCard(project: project)),
        ),
      ),
    );

    expect(find.text('Test App'), findsOneWidget);
    expect(find.text('A sample tagline'), findsOneWidget);

    await tester.tap(find.text('View details'));
    await tester.pumpAndSettle();

    expect(find.text('Detailed description'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
  });
}
