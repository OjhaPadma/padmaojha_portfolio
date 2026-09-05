import 'models/education.dart';
import 'models/experience.dart';
import 'models/project.dart';
import 'models/service.dart';
import 'models/skill_group.dart';

abstract final class PortfolioContent {
  static const name = 'Padma Ojha';
  static const title = 'Senior Flutter Developer';
  static const location = 'Ahmedabad, Gujarat, India';
  static const email = 'padmaojha1110@gmail.com';
  static const linkedInUrl = 'https://linkedin.com/in/padma-ojha';
  static const githubUrl = 'https://github.com/OjhaPadma';
  static const mailto = 'mailto:padmaojha1110@gmail.com';
  static const resumeAssetPath = 'assets/resume/Padma_Ojha.pdf';
  static const resumeWebPath = 'resume/Padma_Ojha.pdf';
  static const profileImagePath = 'assets/images/profile.jpg';
  static const siteTitle = 'Padma Ojha | Senior Flutter Developer';
  static const metaDescription =
      'Senior Flutter developer with 7 years in mobile and 5 years shipping iOS and Android apps. Architecture, APIs, Firebase, payments, and CI/CD.';

  static const heroSummary =
      'Mobile developer with 7 years of experience, including 5 years shipping multi-platform iOS and Android apps with Flutter and Dart. I take products from architecture through release — clean UI, reliable APIs, payments, crash-free quality, and weekly store pipelines.';

  static const skillGroups = [
    SkillGroup(
      title: 'UI',
      items: ['Material Design', 'Custom widgets', 'Animations', 'Gestures'],
    ),
    SkillGroup(
      title: 'Core',
      items: ['Dart', 'Flutter SDK', 'Isolates', 'RxDart'],
    ),
    SkillGroup(
      title: 'Networking',
      items: ['REST', 'Dio', 'WebSockets', 'JSON', 'Bluetooth', 'SMS'],
    ),
    SkillGroup(
      title: 'Persistence',
      items: ['ObjectBox', 'Hive', 'SQLite', 'SharedPreferences', 'Firestore'],
    ),
    SkillGroup(
      title: 'Architecture',
      items: [
        'MVVM',
        'Clean Architecture',
        'Repository Pattern',
        'SOLID',
        'DI',
      ],
    ),
    SkillGroup(
      title: 'State',
      items: ['GetX', 'Provider', 'BLoC/Cubit', 'Riverpod'],
    ),
    SkillGroup(
      title: 'Backend & Cloud',
      items: ['Firebase', 'Supabase', 'FCM'],
    ),
    SkillGroup(
      title: 'Deployment',
      items: [
        'Play Console',
        'App Store Connect',
        'GitHub Actions',
        'Fastlane',
      ],
    ),
    SkillGroup(
      title: 'Testing',
      items: ['Unit tests', 'Widget tests', 'Cross-device QA'],
    ),
    SkillGroup(
      title: 'Tools',
      items: [
        'Android Studio',
        'VS Code',
        'Xcode',
        'Git',
        'Postman',
        'Bruno',
        'Figma',
      ],
    ),
  ];

  static const services = [
    ServiceOffering(
      title: 'Flutter app development',
      description:
          'New iOS and Android products from analysis through store release, with a consistent experience across screen sizes.',
      iconName: 'phone',
    ),
    ServiceOffering(
      title: 'Android-to-Flutter migration',
      description:
          'Unify duplicated native work into one Flutter codebase without dropping the quality bar on either platform.',
      iconName: 'sync',
    ),
    ServiceOffering(
      title: 'Performance and stability',
      description:
          'Profile rebuilds, cut cold start, and keep crash-free sessions high with Sentry and Crashlytics.',
      iconName: 'speed',
    ),
    ServiceOffering(
      title: 'Release pipelines',
      description:
          'Weekly Play and App Store delivery with GitHub Actions, Fastlane, Gradle, and Xcode configuration.',
      iconName: 'rocket',
    ),
  ];

  static const projects = [
    Project(
      name: 'CoffeeWeb',
      tagline:
          'Real-time coffee trading platform with live quotes and community chat',
      platformLabel: 'Flutter · iOS & Android',
      description:
          'Cross-platform app for the global coffee industry: live market prices, industry news, community networking, and subscription-based premium services.',
      tech: [
        'Flutter',
        'Dart',
        'GetX',
        'WebSockets',
        'Supabase',
        'Firebase',
        'Stripe',
        'Razorpay',
        'PayPal',
      ],
      highlights: [
        'Built from scratch for iOS and Android with MVVM, repository pattern, and GetX.',
        'Payments via Stripe, Razorpay, PayPal, and Apple In-App Purchase.',
        'Cut cold-start time ~40%; crash-free sessions above 99%.',
      ],
    ),
    Project(
      name: 'Agora City Centre',
      tagline: 'Property information and lifestyle amenities app',
      platformLabel: 'Flutter · Firebase',
      description:
          'Mobile app for property information, lifestyle amenities, events, retail, and customer engagement.',
      tech: ['Flutter', 'Firebase'],
    ),
    Project(
      name: 'Munim App',
      tagline: 'Employee management for attendance, payroll, and reporting',
      platformLabel: 'Android · Java',
      description:
          'Native Android employee management app covering attendance, payroll, leave requests, and reporting.',
      tech: ['Android', 'Java'],
    ),
  ];

  static const experience = [
    Experience(
      role: 'Senior Software Engineer – Flutter',
      company: 'CoffeeWeb Technologies Pvt. Ltd.',
      location: 'Bangalore, India',
      dates: 'Aug 2023 – May 2026',
      bullets: [
        'Built the CoffeeWeb iOS and Android app from scratch with Flutter, MVVM, and GetX across auth, profile, news, subscriptions, notifications, theme, and community.',
        'Integrated REST APIs with Dio plus Stripe, Razorpay, PayPal, and Apple IAP; used RxDart and background queues for reliable sync.',
        'Cut cold-start time ~40%, kept crash-free sessions above 99% with Sentry and Crashlytics, and shipped weekly via GitHub Actions and Fastlane.',
        'Led code reviews and mentored 3 junior Flutter developers.',
      ],
    ),
    Experience(
      role: 'Software Engineer – Mobile Development',
      company: 'IT Plus I Software Pvt. Ltd.',
      location: 'Bangalore, India',
      dates: 'Mar 2022 – Aug 2023',
      bullets: [
        'Shipped native Android and Flutter apps for business clients with Material and HIG-aligned UI.',
        'Migrated Android modules to Flutter to unify the codebase and shorten later feature work.',
        'Partnered with QA to catch production issues before release.',
      ],
    ),
    Experience(
      role: 'Mobile Application Developer',
      company: 'Calcite Software Solutions LLP',
      location: 'Bangalore, India',
      dates: 'Nov 2020 – Feb 2022',
      bullets: [
        'Built Android and Flutter apps across finance, retail, and enterprise clients.',
        'Designed reusable UI and REST modules that sped up subsequent features.',
      ],
    ),
  ];

  static const earlyCareer = Experience(
    role: 'Early career',
    company: 'Freelance, Arun Data Processing, K Track Devices',
    location: 'India',
    dates: 'Mar 2015 – Nov 2020',
    bullets: [
      'Freelance Flutter and Android delivery (2019–2020), Java/Android at Arun Data Processing, and embedded C/C++ GPS firmware with Bluetooth and SMS at K Track Devices.',
    ],
  );

  static const education = Education(
    degree: 'Bachelor of Computer Applications (BCA)',
    institution: 'Jai Narain Vyas University (JNVU)',
    university: 'Jodhpur',
  );
}
