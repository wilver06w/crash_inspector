# Crash Inspector

<h4 align="center">A Flutter application for crash inspection and analysis.</h4>

<p align="center">
  <a href="https://flutter.dev/">
    <img src="https://img.shields.io/badge/Flutter-3.7+-blue.svg" alt="Flutter">
  </a>
  <a href="https://dart.dev/">
    <img src="https://img.shields.io/badge/Dart-3.7+-blue.svg" alt="Dart">
  </a>
  <a href="https://pub.dev/packages/bloc">
    <img src="https://img.shields.io/badge/State_Management-BLoC-purple.svg" alt="BLoC">
  </a>
  <a href="https://pub.dev/packages/flutter_modular">
    <img src="https://img.shields.io/badge/Architecture-Modular-green.svg" alt="Modular">
  </a>
</p>

## Overview

Crash Inspector is a Flutter application designed to help users inspect and analyze crash reports. The application uses modern Flutter architecture patterns and best practices to provide a robust and maintainable codebase.

## Features

- Modern architecture using BLoC pattern
- Modular routing system
- Localization support
- Caching system
- Smart retry mechanism for network requests
- Material Design implementation
- Lottie animations support

## Getting Started

### Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK (^3.7.2)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/crash_inspector.git
cd crash_inspector
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/           # Core functionality and utilities
├── data/          # Data layer (repositories, data sources)
├── domain/        # Business logic and entities
├── presentation/  # UI layer (screens, widgets)
└── main.dart      # Application entry point
```

## Dependencies

### Main Dependencies
- `flutter_modular`: ^6.3.4 - For modular architecture
- `bloc`: ^8.1.4 - For state management
- `dio`: ^5.4.0 - For HTTP requests
- `dartz`: ^0.10.1 - For functional programming
- `freezed`: ^2.5.2 - For immutable models
- `lottie`: ^3.3.1 - For animations
- `shared_preferences`: ^2.5.3 - For local storage

### Dev Dependencies
- `build_runner`: ^2.4.11 - For code generation
- `mockito`: ^5.4.4 - For testing
- `flutter_lints`: ^4.0.0 - For code quality

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All contributors who have helped shape this project
