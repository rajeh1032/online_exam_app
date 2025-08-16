# Online Exam App

A Flutter application for conducting and taking online examinations with real-time features, secure authentication, and comprehensive result tracking.

## 📸 Screenshots

<!-- Add your app screenshots here -->
<p align="center">
  <<img width="350" height="716" alt="login_1" src="https://github.com/user-attachments/assets/64ad6986-2d14-4f4c-ac00-7de11d4b6bba" />
>
  <<img width="363" height="791" alt="signup_1" src="https://github.com/user-attachments/assets/2d60733d-2ecb-4671-9308-5260dd982c34" />
>
  <<img width="352" height="782" alt="forget_password_1" src="https://github.com/user-attachments/assets/fa94fc08-56e1-4b2a-b0a1-0bacbcf3d763" />
>
  <<img width="358" height="786" alt="email_verification_1" src="https://github.com/user-attachments/assets/0612fd7e-1043-43a6-9192-b570a6fefb71" />
>
      <<img width="361" height="777" alt="change_password_1" src="https://github.com/user-attachments/assets/5555d785-29e2-4bd9-b7a9-2a9d105ce6f8" />
</p>

<p align="center">
  <<img width="354" height="781" alt="browse_by_subject_screen_1" src="https://github.com/user-attachments/assets/c28bbc65-a8f6-4efd-bf0d-92947a5e1642" />
>
>
  <<img width="360" height="786" alt="browse_by_subject_screen_2" src="https://github.com/user-attachments/assets/803236e8-5434-4a58-a096-ec31c78dce84" />
>
  <<img width="352" height="779" alt="exams_by_subject" src="https://github.com/user-attachments/assets/5a1a322b-9590-4990-9003-5a2aef2d367f" />
>
  <<img width="356" height="779" alt="start_exam_screen" src="https://github.com/user-attachments/assets/6ee555e0-0845-4eae-8f7d-4553e2633a70" />
>
</p>

<p align="center">
  <<img width="356" height="780" alt="exam_screen" src="https://github.com/user-attachments/assets/adfe99de-03f5-4e0e-b2de-2ed54f90de20" />
>
  <<img width="360" height="782" alt="exam_score_screen" src="https://github.com/user-attachments/assets/209f537f-77bd-4cab-861b-8f0d1aad0340" />
>
  <<img width="357" height="773" alt="result_screen" src="https://github.com/user-attachments/assets/b56ca488-2b8e-4d52-830e-403f754f92e5" />
>
  <<img width="346" height="783" alt="profile_1" src="https://github.com/user-attachments/assets/52623659-809e-4fdb-b024-992c730464cc" />
>
     <<img width="361" height="777" alt="change_password_1" src="https://github.com/user-attachments/assets/67fcd179-666d-4716-bc15-1f62c619a59b" />
</p>



## 🎥 Demo Video

<p align="center">
  <video width="400" controls>
    <source src="app_demo.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</p>

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
