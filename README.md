<img width="1920" height="945" alt="2025-08-16 01_00_30-Greenshot" src="https://github.com/user-attachments/assets/12e2a247-7761-43df-91da-26fd1a04daf2" /># Online Exam App

A Flutter application for conducting and taking online examinations with real-time features, secure authentication, and comprehensive result tracking.


## ✨ Features

- **🔐 OTP Authentication** - Secure PIN-based user verification
- **⏱️ Timed Exams** - Built-in countdown timer for exam sessions
- **📊 Visual Results** - Progress indicators and score displays
- **📱 Responsive UI** - Adaptive design for all screen sizes
- **💾 Offline Support** - Local data caching for uninterrupted experience
- **🖼️ Rich Content** - Support for images and SVG graphics in questions

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

- **Presentation Layer**: UI components with BLoC for state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repository pattern with local and remote data sources
- **Dependency Injection**: Service locator pattern using `get_it`

```
lib/
├── core/           # Shared utilities and constants
├── data/           # Data sources, models, repositories
├── domain/         # Entities, use cases, repository interfaces
├── presentation/   # UI screens, widgets, BLoCs
└── injection/      # Dependency injection setup
```

## 🛠️ Tech Stack

- **State Management**: BLoC Pattern (`flutter_bloc`)
- **Networking**: REST API with `dio` and `retrofit`
- **Local Storage**: `hive` and `shared_preferences`
- **UI Components**: `flutter_screenutil`, `shimmer`, `percent_indicator`
- **Authentication**: `pin_code_fields`, `pinput`

## 🚀 Getting Started

1. **Clone and install**
   ```bash
   git clone <repository-url>
   cd online_exam_app
   flutter pub get
   ```

2. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Build

```bash
# Android
flutter build apk --release

# iOS  
flutter build ios --release
```

## 📄 License

This project is licensed under the MIT License.

---

**Built with ❤️ using Flutter**
