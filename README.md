<img width="1920" height="945" alt="2025-08-16 01_00_30-Greenshot" src="https://github.com/user-attachments/assets/12e2a247-7761-43df-91da-26fd1a04daf2" /># Online Exam App

A Flutter application for conducting and taking online examinations with real-time features, secure authentication, and comprehensive result tracking.

## 📸 Screenshots

<!-- Add your app screenshots here -->
<!-- Add your app screenshots here -->
<p align="center">
  <<img width="350" height="716" alt="login_1" src="https://github.com/user-attachments/assets/27836e1e-4fb4-4690-a767-f16072d139e1" />
 />
" width="200" />
  <<img width="343" height="724" alt="login_2" src="https://github.com/user-attachments/assets/977908ca-7ae8-483e-9f3b-a191d9a5cbe3" />
>
" width="200" />
  <<img width="339" height="745" alt="login_3" src="https://github.com/user-attachments/assets/69438d2a-f844-4c9e-b29a-03c61b5bfa1a" />
>
  <<img width="363" height="791" alt="signup_1" src="https://github.com/user-attachments/assets/41415e0d-27b5-4c57-a262-ef369b91ad22" />
>
</p>
<p align="center">
  <<img width="355" height="787" alt="signup_2" src="https://github.com/user-attachments/assets/eceaab42-56da-44e8-a23e-9ba0e3007cc7" />
>
  <<img width="352" height="775" alt="signup_3" src="https://github.com/user-attachments/assets/6082a3b9-73f4-42f2-8919-f05c7fb69889" />
>
  <<img width="352" height="782" alt="forget_password_1" src="https://github.com/user-attachments/assets/721fcda9-ddfc-4372-afd1-cbe7cc79c1d4" />
>
  <<img width="359" height="778" alt="forget_password_2" src="https://github.com/user-attachments/assets/14934cdd-8148-4123-a8bd-e2e7e85a9e09" />
>
</p>
<p align="center">
  <<img width="360" height="781" alt="forget_password_3" src="https://github.com/user-attachments/assets/787eb70e-2f79-42da-b75c-c08e03e42b31" />
>
  <<img width="358" height="786" alt="email_verification_1" src="https://github.com/user-attachments/assets/4193ee6b-d1ce-49d4-acab-b50499ad9d2d" />
>
  <<img width="356" height="790" alt="email_verification_2" src="https://github.com/user-attachments/assets/5bd282f9-b717-4353-9b47-75bd58fa1c6b" />
>
  <<img width="354" height="781" alt="browse_by_subject_screen_1" src="https://github.com/user-attachments/assets/51cd711a-4d88-492d-9924-8acb67e711cb" />
>
</p>
<p align="center">
  <<img width="360" height="786" alt="browse_by_subject_screen_2" src="https://github.com/user-attachments/assets/6c9fbaef-00be-44f3-8e48-91bd767abb78" />
>
  <<img width="352" height="779" alt="exams_by_subject" src="https://github.com/user-attachments/assets/6c68f747-8177-4ce3-91db-98022c6e3e44" />
>
  <<img width="356" height="779" alt="start_exam_screen" src="https://github.com/user-attachments/assets/0769c53c-0675-4431-9082-d9d7bebc157f" />
>
  <<img width="356" height="780" alt="exam_screen" src="https://github.com/user-attachments/assets/d8188c7c-fda5-4a1a-a395-441b39f5470e" />
>
    <<img width="360" height="782" alt="exam_score_screen" src="https://github.com/user-attachments/assets/5a2fc750-dcd7-4247-ad1c-790d91febaf1" />
>
    <<img width="348" height="779" alt="answers_screen" src="https://github.com/user-attachments/assets/f63b4fce-df94-465e-8a1b-f8602e563a8d" />
>
    <<img width="346" height="783" alt="profile_1" src="https://github.com/user-attachments/assets/9559b300-5e0c-4821-92e5-6b1b9b795e15" />
>
</p>

## 🎥 Demo Video

<p align="center">
  <video width="400" controls>
    <source src="demo/app_demo.mp4" type="video/mp4">
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
