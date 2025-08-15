# Online Exam App

A Flutter application for conducting and taking online examinations with real-time features, secure authentication, and comprehensive result tracking.

## 📸 Screenshots

<!-- Add your app screenshots here -->
<!-- Add your app screenshots here -->
<p align="center">
  <<img width="350" height="716" alt="login_1" src="https://github.com/user-attachments/assets/27836e1e-4fb4-4690-a767-f16072d139e1" />
 />
" width="200" />
  <img src="<img width="343" height="724" alt="login_2" src="https://github.com/user-attachments/assets/44e9b8b5-dd7d-4f25-9572-70f07bca05eb" />
" width="200" />
  <img src="screenshots/otp_verification_screen.png" width="200" />
  <img src="screenshots/profile_setup_screen.png" width="200" />
</p>
<p align="center">
  <img src="screenshots/home_screen.png" width="200" />
  <img src="screenshots/exam_list_screen.png" width="200" />
  <img src="screenshots/exam_details_screen.png" width="200" />
  <img src="screenshots/exam_instructions_screen.png" width="200" />
</p>
<p align="center">
  <img src="screenshots/exam_question_screen.png" width="200" />
  <img src="screenshots/exam_timer_screen.png" width="200" />
  <img src="screenshots/exam_review_screen.png" width="200" />
  <img src="screenshots/exam_submit_screen.png" width="200" />
</p>
<p align="center">
  <img src="screenshots/results_screen.png" width="200" />
  <img src="screenshots/score_details_screen.png" width="200" />
  <img src="screenshots/exam_history_screen.png" width="200" />
  <img src="screenshots/profile_screen.png" width="200" />
</p>

## 🎥 Demo Video

<!-- Add your demo video here -->
<p align="center">
  <a href="demo_video.mp4">
    <img src="screenshots/video_thumbnail.png" width="400" alt="Demo Video" />
  </a>
</p>

*Click the image above to watch the demo video*

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
