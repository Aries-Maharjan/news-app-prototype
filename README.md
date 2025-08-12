# News App Prototype

A simple news application that aggregates and displays news articles from various sources.

## Features

- Browse latest news articles
- Onboarding screen for new users
- News list with category filtering (business focus)
- Detailed news article view
- Responsive design for mobile devices
- Custom news card components

## Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/news-app-prototype.git
cd news-app-prototype
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure your API key:
   Update the API key in `lib/config/network/api_endpoint.dart`:
```dart
static const String apiKey = "your_api_key_here";
```

4. Run the app:
```bash
flutter run
```

For specific platforms:
```bash
flutter run -d android    # Run on Android
flutter run -d ios        # Run on iOS
```

## API Integration

This app uses [NewsAPI.org](https://newsapi.org/) for fetching news articles. The app is configured to fetch:
- Top headlines by country (US) and category (business)
- Various news categories

You'll need to:
1. Sign up for a free account at NewsAPI.org
2. Get your API key
3. Replace the API key in `lib/config/network/api_endpoint.dart`

**Note**: The current API key in the code should be replaced with your own for production use.

## Technologies Used

- Flutter
- Dart
- HTTP package for API calls
- NewsAPI.org for news data
- Feature-based architecture (auth, news)
- MVC pattern (Model-View-Controller)

## Project Structure

```
lib/
├── config/
│   └── network/
│       ├── api_endpoint.dart
│       └── core/
├── feat/
│   ├── auth/
│   └── news/
│       ├── ctrl/
│       │   └── news_ctrl.dart
│       ├── model/
│       │   └── news_model.dart
│       └── view/
│           ├── new_details.dart
│           ├── news_card.dart
│           ├── news_list.dart
│           └── on_boarding_screen.dart
└── main.dart
```

## Available Commands

- `flutter run` - Run the app in debug mode
- `flutter build apk` - Build APK for Android
- `flutter build ios` - Build for iOS
- `flutter test` - Run unit tests
- `flutter analyze` - Analyze code for issues
- `flutter clean` - Clean build files

## Contributing

This is a prototype project. Feel free to fork and experiment!

## Known Issues

- Limited to 100 API requests per day (free tier)
- Search results are cached for 15 minutes
- Bookmark feature uses SharedPreferences only

## Future Enhancements

- [ ] User authentication
- [ ] Personal news feed
- [ ] Social sharing features
- [ ] Offline reading mode
- [ ] Push notifications

## License

This project is open source. 

## Contact

Your Name - ariesmhr@gmail.com
Project Link: [https://github.com/Aries-Maharjan/news-app-prototype]

