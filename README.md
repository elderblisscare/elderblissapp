# 🏥 ElderBlissCare

A comprehensive Flutter-based mobile application designed to provide on-demand elder care and healthcare services, ensuring accessibility, reliability, and peace of mind for seniors and their families.

## Project Overview

ElderBlissCare is a production-ready mobile app that connects elderly users with essential healthcare services at home. The platform offers 24/7 emergency support, personalized medical care, and educational content, reducing the need for hospital visits and providing families with real-time monitoring capabilities. Built with Flutter for cross-platform compatibility, it integrates Firebase for backend services and Razorpay for secure payments.

## Target Users

- **Elderly Individuals**: Seniors requiring home-based medical care, emergency assistance, and lifestyle support
- **Family Caregivers**: Relatives managing elder care responsibilities
- **Healthcare Providers**: Medical professionals offering services through the platform
- **Urban Residents**: Users in metropolitan areas like Delhi, focusing on quick response times

## Tech Stack

- Flutter and Dart (cross-platform app development)
- Firebase Auth, Cloud Firestore, Firebase Storage
- Firebase Analytics, Crashlytics, Firebase Performance
- Provider (state management)
- Razorpay Flutter (payments)
- HTTP and Dio (networking)
- Shared Preferences and SQFlite (local persistence)
- Flutter Localizations and Intl
- Google Fonts, Font Awesome, Flutter Animate, Rive
- Android (Gradle), iOS (CocoaPods), Web (Flutter Web)

## Project Structure

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

## Key Features

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

## Authentication Details

Supports multiple authentication methods:
- Phone Authentication (SMS OTP)
- Email/Password
- Google Sign-In
- Apple Sign-In
- GitHub Sign-In
- Anonymous Sign-In
- JWT-based Sign-In

## State Management Explanation

Uses Provider with Firebase auth streams and persisted local state.

## Setup Instructions

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

## Monitoring & Analytics

Uses Firebase Analytics, Crashlytics, and Performance Monitoring for product insights, stability, and runtime health.

## Security Considerations

- **API Key Management**: Environment-based configuration for sensitive keys
- **Firebase Security Rules**: Granular access control for Firestore and Storage
- **Data Encryption**: Firebase handles data encryption at rest and in transit
- **Authentication Security**: Multi-factor authentication support via phone verification
- **Payment Security**: PCI-compliant Razorpay integration

## Contact Information

- **Email**: support@elderbliss.com
- **Website**: [ElderBlissCare](https://www.elderblisscare.com)
- **Social Media**:
  - Instagram: [@elderblisscare](https://www.instagram.com/elderblisscare/)
  - Facebook: [ElderBlissCare](https://www.facebook.com/elderblisscare)

## License

This project is proprietary software. All rights reserved by ElderBlissCare.

## Summary

ElderBlissCare represents a comprehensive solution for elder care in the digital age, combining cutting-edge Flutter development with robust Firebase infrastructure. The app successfully bridges the gap between healthcare needs and technological accessibility, providing seniors with dignity, families with peace of mind, and healthcare providers with efficient service delivery tools. With its focus on emergency response, personalized care, and user-friendly design, ElderBlissCare sets a new standard for healthcare technology in the elder care sector.
