# 📚 Test Me App

A modern, feature-rich online examination mobile application built with Flutter, showcasing best practices in educational technology and clean architecture.

## 📱 Features

### 🔐 Authentication & Security
- Secure user registration and login
- Email verification system
- Password reset functionality
- Profile management with secure sessions

### 📚 Subject Management
- Browse subjects by categories
- Subject-wise exam organization
- Comprehensive subject listings
- Smart subject recommendations

### 📝 Exam Experience
- Timed examination sessions
- Real-time countdown timer
- Question navigation system
- Auto-save functionality

### 📊 Results & Analytics
- Instant score calculation
- Detailed result analysis
- Performance tracking
- Historical exam records

### 👤 User Profile
- Personal profile management
- Password change functionality
- Exam history tracking
- Progress monitoring

## 🛠️ Technology Stack

- **Framework**: Flutter 3.19.0
- **Language**: Dart 3.3.0
- **State Management**: Flutter BLoC
- **Dependency Injection**: Injectable & Get_it
- **Architecture**: Clean Architecture
- **Networking**: Dio & Retrofit
- **Local Storage**: Hive & SharedPreferences
- **UI Components**: Material Design 3

## 📦 Project Structure

```
lib/
├── core/
│   ├── error/
│   ├── services/
│   └── utils/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── screens/
│   ├── widgets/
│   └── blocs/
└── injection/
    └── dependency_injection.dart
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.3.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/rajeh1032/online_exam_app.git
```

2. Navigate to project directory:
```bash
cd online_exam_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Generate code:
```bash
flutter packages pub run build_runner build
```

5. Run the app:
```bash
flutter run
```

## 📸 Screenshots

### 🔐 Authentication Screens
Secure user authentication with modern UI design

| **Login** | **Sign Up** | **Forget Password** | **Email Verification** | **Change Password** |
|:---:|:---:|:---:|:---:|:---:|
| <img width="350" height="716" alt="login_1" src="https://github.com/user-attachments/assets/64ad6986-2d14-4f4c-ac00-7de11d4b6bba" /> | <img width="363" height="791" alt="signup_1" src="https://github.com/user-attachments/assets/2d60733d-2ecb-4671-9308-5260dd982c34" /> | <img width="352" height="782" alt="forget_password_1" src="https://github.com/user-attachments/assets/fa94fc08-56e1-4b2a-b0a1-0bacbcf3d763" /> | <img width="358" height="786" alt="email_verification_1" src="https://github.com/user-attachments/assets/0612fd7e-1043-43a6-9192-b570a6fefb71" /> | <img width="361" height="777" alt="change_password_1" src="https://github.com/user-attachments/assets/5555d785-29e2-4bd9-b7a9-2a9d105ce6f8" /> |

---

### 📚 Subject & Exam Management
Browse subjects and manage exam sessions

| **Browse Subjects** | **Subject Categories** | **Exams by Subject** | **Start Exam** |
|:---:|:---:|:---:|:---:|
| <img width="354" height="781" alt="browse_by_subject_screen_1" src="https://github.com/user-attachments/assets/c28bbc65-a8f6-4efd-bf0d-92947a5e1642" /> | <img width="360" height="786" alt="browse_by_subject_screen_2" src="https://github.com/user-attachments/assets/803236e8-5434-4a58-a096-ec31c78dce84" /> | <img width="352" height="779" alt="exams_by_subject" src="https://github.com/user-attachments/assets/5a1a322b-9590-4990-9003-5a2aef2d367f" /> | <img width="356" height="779" alt="start_exam_screen" src="https://github.com/user-attachments/assets/6ee555e0-0845-4eae-8f7d-4553e2633a70" /> |
| Browse available subjects | Organized subject categories | Subject-specific exams | Exam preparation screen |

---

### 📝 Exam Experience & Results
Complete examination flow with detailed results

| **Exam Screen** | **Score Display** | **Result Analysis** | **Answer Review** | **User Profile** |
|:---:|:---:|:---:|:---:|:---:|
| <img width="356" height="780" alt="exam_screen" src="https://github.com/user-attachments/assets/adfe99de-03f5-4e0e-b2de-2ed54f90de20" /> | <img width="360" height="782" alt="exam_score_screen" src="https://github.com/user-attachments/assets/209f537f-77bd-4cab-861b-8f0d1aad0340" /> | <img width="357" height="773" alt="result_screen" src="https://github.com/user-attachments/assets/b56ca488-2b8e-4d52-830e-403f754f92e5" /> | <img width="348" height="779" alt="answers_screen" src="https://github.com/user-attachments/assets/124985c9-18d1-43fd-ba7e-f5c2daf3df7d" /> | <img width="346" height="783" alt="profile_1" src="https://github.com/user-attachments/assets/52623659-809e-4fdb-b024-992c730464cc" /> |
| Interactive exam interface | Real-time score calculation | Comprehensive result details | Review correct answers | Personal profile management |

---

### 🎨 UI/UX Highlights

#### ✨ **Key Features Demonstrated:**
- **Modern Material Design 3** interface with educational aesthetics
- **Responsive layouts** optimized for mobile learning
- **Intuitive navigation** with clear exam flow
- **Real-time feedback** with instant scoring
- **Seamless user experience** across all examination stages
- **Consistent branding** and educational design patterns

#### 🌟 **Design Excellence:**
- Smooth exam transitions and animations
- Optimized loading states for questions
- Error handling with educational guidance
- Accessibility-focused design for all learners
- Cross-platform consistency

---

### 📱 App Flow Overview

```
🔐 Authentication → 📚 Browse Subjects → 📝 Select Exam → ⏱️ Take Exam → 📊 View Results → 👤 Profile
                     ↓
                  📖 Review Answers ← → 📈 Performance Analytics
```

**Total Screenshots:** 14 screens showcasing complete examination journey

## 🎥 Demo Video

<p align="center">
  <video width="400" controls>
    <source src="app_demo.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</p>

## 🎯 Features in Detail

### Clean Architecture
- Separation of concerns
- Domain-driven design
- Repository pattern
- Use case implementation

### State Management
- BLoC pattern for predictable state management
- Event-driven architecture
- Reactive programming

### Educational Features
- Timed examinations with countdown
- Question navigation and review
- Instant scoring and feedback
- Progress tracking and analytics

### Performance
- Optimized question loading
- Efficient state management
- Local data caching
- Memory leak prevention

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Developer

**Rajeh1032**
- GitHub: @rajeh1032
- Email: rajeh1032@example.com

## 🔮 Future Roadmap

- ✅ Multi-language support
- ✅ Offline exam capability
- ✅ Advanced analytics dashboard
- ✅ Question bank management
- ✅ Certificate generation
- ✅ Social learning features
- ✅ AI-powered recommendations

## 📞 Contact

For any queries or support, please reach out to:

- **Email:** [wasimghoniem@gmail.com](mailto:wasimghoniem@gmail.com)  
- **GitHub:** [wasimGhoniem](https://github.com/wasimGhoniem)  
- **LinkedIn:** [wasim-ghonim](https://www.linkedin.com/in/wasim-ghonim-37bb98333)  

---

⭐ **Star this repository if you find it helpful!**

**Built with ❤️ using Flutter**
