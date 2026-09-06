# Padma Ojha — Flutter Portfolio

A responsive, single-page personal website built with **Flutter Web**. It presents my background as a Senior Flutter Developer: shipped work, skills, experience, and a straightforward way to get in touch.

Live source: [github.com/OjhaPadma/padmaojha_portfolio](https://github.com/OjhaPadma/padmaojha_portfolio)

<p align="center">
  <img src="assets/images/profile.jpg" alt="Padma Ojha" width="160" height="160" style="border-radius: 16px;" />
</p>

---

## Overview

This app is a content-driven portfolio rather than a multi-route CMS. All visible copy (name, summary, projects, roles, skills) lives in one Dart file so updates do not require hunting through widgets. The layout is a sticky navigation bar plus a vertical page: About, Skills & services, Projects, Experience, Education, Contact, and Footer.

It is intended for recruiters, hiring managers, and collaborators who want a concise view of my Flutter and mobile delivery experience—including production work on CoffeeWeb (real-time markets, payments, crash-free quality, weekly store releases).

---

## Key features

- **Single-page navigation** — Desktop link row and a compact mobile menu; sections scroll into view with `GlobalKey` + `Scrollable.ensureVisible`.
- **Responsive layout** — Breakpoints at 600px and 1024px; content is capped at 1200px on wide screens.
- **Hero and résumé** — Photo, role, location, short summary, and downloadable PDF (`web/resume/Padma_Ojha.pdf` in release builds).
- **Skills and services** — Grouped chips plus four service cards (new Flutter apps, Android-to-Flutter migration, performance/stability, release pipelines).
- **Project showcase** — Cards for CoffeeWeb, Agora City Centre, and Munim App (Munim is labeled Android/Java). Details open in a dialog.
- **Experience timeline** — Achievement-focused bullets (for example ~40% cold-start improvement and 99% crash-free sessions at CoffeeWeb), with early career (2015–2020) kept in one compact block.
- **Contact** — Email (`mailto:`), LinkedIn, and GitHub. Phone is omitted on purpose to reduce spam.
- **Web polish** — Custom loading splash, Open Graph / meta tags, Google Fonts (Sora + Inter), light motion via `flutter_animate`.

---

## Technologies

| Area | Choice |
| --- | --- |
| UI framework | Flutter (Material 3), Dart SDK `^3.12.2` |
| Typography | `google_fonts` |
| Links / résumé | `url_launcher` |
| Motion | `flutter_animate` |
| Quality | `flutter_lints`, `flutter_test` |
| Hosting | GitHub Pages (workflow in `.github/workflows/deploy.yml`) or Vercel (`vercel.json`) |

State management libraries (BLoC, Riverpod, GetX) are intentionally unused: the site has almost no dynamic state beyond scroll position and a mobile menu flag.

---

## Project structure

```
lib/
  main.dart / app.dart
  core/          # theme, spacing, breakpoints, URL helpers
  data/          # models + portfolio_content.dart (single source of truth)
  pages/         # HomePage (scroll + nav keys)
  sections/      # hero, skills, projects, experience, education, contact, footer
  widgets/       # nav bar, section container, buttons, scroll reveal
assets/images/   # profile photo
assets/resume/   # bundled PDF (debug downloads)
web/resume/      # PDF served in production
tool/vercel_build.sh
```

To change site copy, edit [`lib/data/portfolio_content.dart`](lib/data/portfolio_content.dart) and hot restart.

---

## Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) (stable channel; SDK matching `pubspec.yaml`)
- Chrome (recommended for local web)
- Optional: [Vercel CLI](https://vercel.com/docs/cli) if you deploy with Vercel

Enable web if needed:

```bash
flutter config --enable-web
flutter doctor
```

---

## Installation

```bash
git clone https://github.com/OjhaPadma/padmaojha_portfolio.git
cd padmaojha_portfolio
flutter pub get
```

---

## Usage

Run the site in Chrome:

```bash
flutter run -d chrome
```

While that process is running: `r` hot reload, `R` hot restart, `q` quit.

### Tests and static analysis

```bash
dart format .
flutter analyze
flutter test
```

Widget tests cover the navigation labels and the project-detail dialog.

### Production build

**GitHub Pages** (repo is served under `/padmaojha_portfolio/`):

```bash
flutter build web --release --base-href /padmaojha_portfolio/
```

**Vercel, Netlify, Firebase, or a custom domain at the site root:**

```bash
flutter build web --release --base-href /
```

Output directory: `build/web`.

Do not mix the two `base-href` values on the same host; asset paths will break.

---

## Deployment

### GitHub Pages

A workflow at [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml) runs format, analyze, test, and `flutter build web`, then uploads Pages artifacts.

1. Repository **Settings → Pages → Source: GitHub Actions**.
2. Push to `main` (or run the workflow manually).
3. Site URL: `https://ojhapadma.github.io/padmaojha_portfolio/`

### Vercel

[`vercel.json`](vercel.json) points the build at [`tool/vercel_build.sh`](tool/vercel_build.sh) (installs Flutter if needed, then builds with `--base-href /`). Output directory is `build/web`.

1. Import this GitHub repository in the Vercel dashboard.
2. Framework preset: **Other**.
3. Confirm build command `bash tool/vercel_build.sh` and output `build/web`.
4. Deploy. The first build can take several minutes while Flutter is cloned.

CLI alternative (after a local root build):

```bash
flutter build web --release --base-href /
cd build/web && vercel --prod
```

---

## Design notes

The visual language is quiet and spacious: teal primary (`#0F766E`), coffee accent, 16px card radius, and a light canvas. Dark mode is deferred so v1 stays focused on content and layout.

---

## Contact

I am based in Ahmedabad, Gujarat, India.

- **Email:** [padmaojha1110@gmail.com](mailto:padmaojha1110@gmail.com)
- **LinkedIn:** [linkedin.com/in/padma-ojha](https://linkedin.com/in/padma-ojha)
- **GitHub:** [github.com/OjhaPadma](https://github.com/OjhaPadma)

If you are hiring for Flutter or cross-platform mobile work, the résumé download on the site is the same PDF bundled in this repository.
