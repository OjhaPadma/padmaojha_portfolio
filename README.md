# padmaojha_portfolio

Personal portfolio site for **Padma Ojha**, Senior Flutter Developer. Single-page Flutter Web app.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Production build

```bash
flutter build web --release --base-href /padmaojha_portfolio/
```

The web output is `build/web`. Host it on GitHub Pages (this repo’s default), Firebase Hosting, Netlify, or Vercel.

Resume PDF is served from `web/resume/Padma_Ojha.pdf`. Site copy lives in `lib/data/portfolio_content.dart`.
