# 🏥 ElderBlissCare

A comprehensive Flutter-based mobile application designed to provide on-demand elder care and healthcare services, ensuring accessibility, reliability, and peace of mind for seniors and their families.

## 📋 Project Overview

ElderBlissCare is a production-ready mobile app that connects elderly users with essential healthcare services at home. The platform offers 24/7 emergency support, personalized medical care, and educational content, reducing the need for hospital visits and providing families with real-time monitoring capabilities. Built with Flutter for cross-platform compatibility, it integrates Firebase for backend services and Razorpay for secure payments.

## 👥 Target Users

- **Elderly Individuals**: Seniors requiring home-based medical care, emergency assistance, and lifestyle support
- **Family Caregivers**: Relatives managing elder care responsibilities
- **Healthcare Providers**: Medical professionals offering services through the platform
- **Urban Residents**: Users in metropolitan areas like Delhi, focusing on quick response times

## 🛠️ Tech Stack

### Frontend
- **Framework**: Flutter (SDK >=3.0.0 <4.0.0)
- **Language**: Dart
- **UI Components**: Material Design, Google Fonts, Font Awesome Icons
- **Animations**: Flutter Animate, Rive Animations

### Backend & Database
- **Authentication**: Firebase Auth (Email, Phone, Social Logins)
- **Database**: Cloud Firestore
- **Storage**: Firebase Storage
- **Analytics**: Firebase Analytics
- **Monitoring**: Firebase Crashlytics, Firebase Performance

### Tools & Libraries
- **State Management**: Provider
- **Navigation**: GoRouter
- **Payments**: Razorpay Flutter
- **Networking**: HTTP, Dio
- **Local Storage**: Shared Preferences, SQFlite
- **Internationalization**: Flutter Localizations, Intl
- **Development**: Flutter Lints, Flutter Launcher Icons

### Platform Support
- **Mobile**: Android (Gradle), iOS (CocoaPods)
- **Web**: Flutter Web
- **Build Tools**: Gradle, CocoaPods

## 📁 Project Structure

```
lib/
├── auth/                    # Authentication logic
│   ├── firebase_auth/       # Firebase authentication providers
│   └── auth_manager.dart    # Central auth management
├── backend/                 # Backend integrations
│   ├── firebase/            # Firebase configuration
│   ├── api_requests/        # External API calls
│   └── schema/              # Firestore data models
├── components/              # Reusable UI components
│   ├── custom_appbar/       # Custom app bar widget
│   └── title_with_subtitle/ # Title-subtitle component
├── flutter_flow/            # FlutterFlow utilities
├── pages/                   # App screens
│   ├── appnavscreens/       # Main app features
│   ├── onboarding/          # User onboarding flow
│   ├── profile/             # User profile management
│   └── phone_auth/          # Phone authentication
├── main.dart                # App entry point
└── index.dart               # Page exports
```

## ✨ Key Features

### Core Services
- **Emergency Panic Button**: Instant alert system for critical situations
- **Doctor Visits**: On-demand home doctor consultations
- **Nursing Care**: Professional nursing services at home
- **Caregiver Support**: Attendant services for daily assistance
- **Medical Equipment**: Setup and maintenance of home medical devices

### User Experience
- **Subscription Plans**: Tiered pricing with Razorpay integration
- **Educational Blogs**: Healthcare, emergency, lifestyle, and convenience content
- **Profile Management**: Medical history, emergency contacts, family information
- **Real-time Notifications**: Firebase-powered alerts and updates

### Accessibility Features
- **Responsive Design**: Adaptive UI for various screen sizes
- **Multi-language Support**: Internationalization capabilities
- **Offline Capabilities**: Local data persistence with Shared Preferences

## 🔐 Authentication Details

Supports multiple authentication methods:
- **Phone Authentication**: SMS OTP verification with auto-retrieval
- **Email/Password**: Standard email registration and login
- **Social Logins**: Google, Apple, GitHub, and Anonymous access
- **JWT Integration**: Token-based authentication for API access
- **Web Support**: reCAPTCHA integration for web-based phone auth

## 📊 State Management Explanation

Uses Provider for global state management:
- **FFAppState**: Application-wide state (user data, settings, persisted preferences)
- **Firebase Auth Streams**: Real-time authentication state updates
- **ChangeNotifier**: Reactive UI updates for auth and app state changes
- **Local Persistence**: Shared Preferences for offline data storage

## 🧭 Navigation System

- **GoRouter**: Declarative routing with path-based navigation
- **Bottom Navigation**: Floating bottom navigation bar for main sections
- **Deep Linking**: URL-based navigation support
- **Route Guards**: Authentication-based route protection

## 🔗 APIs & Integrations

- **Firebase Services**: Auth, Firestore, Storage, Analytics, Crashlytics, Performance
- **Razorpay**: Secure payment processing with branded checkout
- **External APIs**: Lead creation via ZenEDS Pilot API (`zenedspilotapi.zhl.in`)
- **Social Media**: Instagram and Facebook integration links
- **Cloud Functions**: Node.js backend functions for server-side logic

## 🗄️ Data Models

### Users Record (Firestore)
```dart
class UsersRecord {
  String displayName;
  String uid;
  String phoneNumber;
  DateTime createdTime;
  String role;
  DateTime dateOfBirth;
  String email;
  String photoUrl;
  // Emergency contacts
  String nameEmergency;
  String contactEmergency;
  String relationEmergency;
  // Medical information
  String bloodGroup;
  String medicalCondition;
  String drugAllergy;
}
```

### Subscription Plans
```dart
class Plan {
  String id;
  String name;
  String price;
  List<String> features;
  double numericPrice; // For Razorpay
  bool isFeatured;
}
```

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK (>=3.0.0 <4.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Firebase CLI (for deployment)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/elderblisscare/elderblissapp.git
   cd elderblissapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Copy Firebase config from Firebase Console
   - Update `lib/backend/firebase/firebase_config.dart`

4. **Setup environment variables**
   - Configure `assets/environment_values/environment.json`
   - Add Razorpay API keys

5. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production
```bash
# Android APK
flutter build apk --release

# iOS (on macOS)
flutter build ios --release

# Web
flutter build web --release
```

## 📈 Monitoring & Analytics

- **Firebase Analytics**: Tracks user interactions, screen views, and conversion events
- **Crashlytics**: Automatic crash reporting with detailed stack traces
- **Performance Monitoring**: App performance metrics and latency tracking
- **Custom Events**: Business-specific tracking (e.g., service bookings, plan subscriptions)

## 🔒 Security Considerations

- **API Key Management**: Environment-based configuration for sensitive keys
- **Firebase Security Rules**: Granular access control for Firestore and Storage
- **Data Encryption**: Firebase handles data encryption at rest and in transit
- **Authentication Security**: Multi-factor authentication support via phone verification
- **Payment Security**: PCI-compliant Razorpay integration

## ⚠️ Challenges

- **Healthcare Compliance**: Managing sensitive medical data with appropriate privacy measures
- **Real-time Reliability**: Ensuring 24/7 service availability for emergency features
- **Cross-platform Consistency**: Maintaining UI/UX parity across Android, iOS, and Web
- **Scalability**: Handling growing user base with Firebase infrastructure
- **Offline Functionality**: Balancing online features with offline accessibility

## 🔮 Future Improvements

- **AI Health Monitoring**: Integration with wearable devices for proactive care
- **Telemedicine Features**: Video consultations with healthcare providers
- **IoT Integration**: Smart home devices for automated emergency detection
- **Advanced Analytics**: Predictive health insights using machine learning
- **Multi-language Expansion**: Support for regional languages and dialects
- **Offline Mode Enhancement**: Expanded offline capabilities for critical features

## 🤝 Contribution Guide

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Standards
- Follow Flutter linting rules
- Use meaningful commit messages
- Maintain test coverage for new features
- Update documentation for API changes

## 📞 Contact Information

- **Email**: support@elderbliss.com
- **Website**: [ElderBlissCare](https://www.elderblisscare.com)
- **Social Media**:
  - Instagram: [@elderblisscare](https://www.instagram.com/elderblisscare/)
  - Facebook: [ElderBlissCare](https://www.facebook.com/elderblisscare)

## 📄 License

This project is proprietary software. All rights reserved by ElderBlissCare.

## 📝 Summary

ElderBlissCare represents a comprehensive solution for elder care in the digital age, combining cutting-edge Flutter development with robust Firebase infrastructure. The app successfully bridges the gap between healthcare needs and technological accessibility, providing seniors with dignity, families with peace of mind, and healthcare providers with efficient service delivery tools. With its focus on emergency response, personalized care, and user-friendly design, ElderBlissCare sets a new standard for healthcare technology in the elder care sector.
