# Aurora Finance - Cash Flow

A modern Flutter application for personal finance management and cash flow tracking.

## 📱 Features

- **Home Dashboard**: Overview of your financial status
- **Income Management**: Input and track your income sources
- **Transaction Tracking**: Record and monitor your transactions
- **Financial Breakdown**: Detailed analysis of your finances including:
  - Fixed bills tracking
  - Credit card reserve management
  - Income breakdown
  - Available funds overview
- **Settings**: Customize your financial preferences

## 🏗️ Architecture

The app follows a clean architecture pattern with the following structure:

```
lib/
├── main.dart              # App entry point
└── app/
    ├── app.dart           # Main app widget with routing
    ├── model_view/        # Business logic and state management
    ├── view/
    │   ├── pages/         # App screens
    │   └── widgets/       # Reusable UI components
    └── shared/            # Shared utilities and constants
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.11.4
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd aurora_finance
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📦 Dependencies

### Production
- `google_fonts` ^6.3.2 - Custom typography (Manrope & Inter fonts)
- `font_awesome_flutter` ^11.0.0 - Icon library
- `intl` ^0.20.2 - Internationalization support
- `cupertino_icons` ^1.0.8 - iOS-style icons

### Development
- `flutter_test` - Testing framework
- `flutter_lints` ^6.0.0 - Linting rules

## 🎨 Design

The app features a modern UI with:
- Custom color scheme based on Material Design 3
- Google Fonts integration (Manrope for titles, Inter for body text)
- Responsive design supporting multiple platforms
- Clean and intuitive user interface

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

## 🛠️ Development

### Running in Debug Mode
```bash
flutter run
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

### Testing
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

## 📄 License

This project is private and not licensed for public distribution.

## 🤝 Contributing

This is a private project. For questions or issues, please contact the maintainer.

## 📞 Support

For help getting started with Flutter development, check out these resources:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Flutter Codelabs](https://docs.flutter.dev/get-started/codelab)

---

Built with ❤️ using Flutter
