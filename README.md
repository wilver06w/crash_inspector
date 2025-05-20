# Inspector de Errores

<h1 align="center">
  <br>
  <a href="https://flutter.dev/"><img src="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png" width="200"></a>
  <br>
  Inspector de Errores
  <br>
</h1>

<h4 align="center">Una aplicación Flutter para la inspección y análisis de errores.</h4>

<p align="center">
  <a href="https://flutter.dev/">
    <img src="https://img.shields.io/badge/Flutter-3.7+-blue.svg" alt="Flutter">
  </a>
  <a href="https://dart.dev/">
    <img src="https://img.shields.io/badge/Dart-3.7+-blue.svg" alt="Dart">
  </a>
  <a href="https://pub.dev/packages/bloc">
    <img src="https://img.shields.io/badge/Gestión_de_Estado-BLoC-purple.svg" alt="BLoC">
  </a>
  <a href="https://pub.dev/packages/flutter_modular">
    <img src="https://img.shields.io/badge/Arquitectura-Modular-green.svg" alt="Modular">
  </a>
  <a href="https://pub.dev/packages/dio">
    <img src="https://img.shields.io/badge/HTTP-Dio-blue.svg" alt="Dio">
  </a>
  <a href="https://pub.dev/packages/freezed">
    <img src="https://img.shields.io/badge/Generación_de_Código-Freezed-orange.svg" alt="Freezed">
  </a>
  <a href="https://pub.dev/packages/lottie">
    <img src="https://img.shields.io/badge/Animaciones-Lottie-green.svg" alt="Lottie">
  </a>
</p>

<p align="center">
  <a href="#resumen">Resumen</a> •
  <a href="#características">Características</a> •
  <a href="#requisitos-previos">Requisitos Previos</a> •
  <a href="#instalación">Instalación</a> •
  <a href="#estructura-del-proyecto">Estructura del Proyecto</a> •
  <a href="#dependencias">Dependencias</a> •
  <a href="#contribuciones">Contribuciones</a> •
  <a href="#autores">Autores</a> •
  <a href="#hoja-de-ruta">Hoja de Ruta</a>
</p>

## 🧩 Resumen

Inspector de Errores es una aplicación Flutter diseñada para ayudar a los usuarios a inspeccionar y analizar reportes de errores. Utiliza patrones modernos de arquitectura en Flutter y buenas prácticas para ofrecer una base de código robusta y mantenible.

## ✨ Características

- Arquitectura moderna utilizando el patrón BLoC
- Sistema de enrutamiento modular
- Soporte para localización (traducción de idiomas)
- Sistema de caché
- Mecanismo inteligente de reintentos para peticiones de red
- Implementación basada en Material Design
- Soporte para animaciones con Lottie

## ✅ Requisitos Previos

### Este proyecto requiere:
- [Flutter SDK] versión 3.7.2 o superior
- [Dart SDK] versión 3.7.2 o superior
- [Android Studio] o [VS Code] con extensiones de Flutter
- [Git] para control de versiones

## ⚙️ Instalación

Para clonar esta aplicación desde la línea de comandos:

```bash
git clone https://github.com/yourusername/crash_inspector.git
cd crash_inspector
flutter pub get
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

## Authors

| [<img src="https://github.com/wilver06w.png" width=115><br><sub>Your Name</sub>](https://github.com/wilver06w) |
|:-------------------------------------------------------------------------------------------------------------------:|

## Roadmap

- [ ] Add crash report export functionality
- [ ] Implement crash report search

