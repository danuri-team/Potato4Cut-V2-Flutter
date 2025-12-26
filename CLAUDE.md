# Claude Code Instructions for potato_4cut_v2

## Project Context

Flutter application using Riverpod for state management, GoRouter for navigation, and Dio for network requests.

## Tech Stack

- **Flutter**: 3.38.2
- **Dart**: 3.10.0
- **State Management**: flutter_riverpod ^2.6.1
- **Navigation**: go_router ^16.3.0
- **Network**: dio ^5.9.0
- **Authentication**: Firebase Auth, Sign in with Apple, Google Sign In
- **UI**: flutter_screenutil, flutter_svg, custom fonts (ownglyph_pdh)

## Architecture Structure

```
lib/
├── core/
│   ├── network/     # Dio configuration
│   ├── provider/    # Global Riverpod providers
│   ├── router/      # GoRouter configuration
│   ├── services/    # FCM and other services
│   ├── theme/       # App colors and text styles
│   ├── ui/          # Reusable UI components
│   └── util/        # Utility functions
└── features/        # Feature-based modules
    ├── home/
    ├── splash/
    └── [other features]/
```

## API Integration Rules

### 1. Import API Documentation

Use Postman MCP to import API documentation from fixed collection links:

```
@postman import https://studio0o.postman.co/workspace/%EB%8B%A4%EB%88%84%EB%A6%AC%ED%8C%80~86e85554-36de-46f9-af55-0d45fdab7ad0/collection/14126813-626e32b8-3c6b-41fc-9e3e-bc09a00c0d18?action=share&source=copy-link&creator=14126813
```

### 2. Code Generation Standards

#### Model Classes

- Location: `lib/features/[feature]/data/models/`
- Use `json_annotation` and `json_serializable`
- NO documentation comments unless explicitly requested
- Example:

```dart
import 'package:json_annotation/json_annotation.dart';

part '[model_name].g.dart';

@JsonSerializable()
class [ModelName] {
  final String id;
  final String name;

  const [ModelName]({
    required this.id,
    required this.name,
  });

  factory [ModelName].fromJson(Map<String, dynamic> json) =>
      _$[ModelName]FromJson(json);

  Map<String, dynamic> toJson() => _$[ModelName]ToJson(this);
}
```

#### Repository Classes

- Location: `lib/features/[feature]/data/repositories/`
- Use Dio instance from `core/network/dio.dart`
- Return types should handle errors properly
- Example:

```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class [Feature]Repository {
  final Dio _dio;

  [Feature]Repository(this._dio);

  Future<[Model]> get[Model]() async {
    try {
      final response = await _dio.get('/endpoint');
      return [Model].fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}

final [feature]RepositoryProvider = Provider((ref) {
  return [Feature]Repository(ref.read(dioProvider));
});
```

#### Provider Classes

- Location: `lib/features/[feature]/presentation/providers/`
- Use Riverpod providers with proper state management
- Example:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final [feature]Provider = StateNotifierProvider<[Feature]Notifier, [State]>((ref) {
  return [Feature]Notifier(ref.read([feature]RepositoryProvider));
});

class [Feature]Notifier extends StateNotifier<[State]> {
  final [Feature]Repository _repository;

  [Feature]Notifier(this._repository) : super([InitialState]);

  Future<void> fetch() async {
    state = [LoadingState];
    try {
      final data = await _repository.get[Model]();
      state = [SuccessState](data);
    } catch (e) {
      state = [ErrorState](e.toString());
    }
  }
}
```

## Code Style Rules

### PROHIBITED

- NO comments unless explicitly requested
- NO documentation generation without explicit request
- NO redundant comments explaining obvious code
- NO TODO comments without explicit approval
- NO print statements in production code

### REQUIRED

- Clean, self-documenting code
- Consistent naming conventions (camelCase for variables, PascalCase for classes)
- Proper error handling with try-catch blocks
- Use const constructors where possible
- Follow Flutter best practices and conventions

## File Organization

### Feature Module Structure

```
features/[feature_name]/
├── data/
│   ├── models/
│   ├── repositories/
│   └── data_sources/
├── domain/
│   ├── entities/
│   └── use_cases/
└── presentation/
    ├── pages/
    ├── widgets/
    └── providers/
```

## Navigation Integration

- Add routes to `lib/core/router/router.dart`
- Use typed routing with GoRouter
- Example:

```dart
GoRoute(
  path: '/[feature]',
  builder: (context, state) => const [Feature]Page(),
),
```

## UI Component Rules

- Reusable components go in `lib/core/ui/`
- Feature-specific widgets in `lib/features/[feature]/presentation/widgets/`
- Use `flutter_screenutil` for responsive sizing
- Apply theme from `app_color.dart` and `app_text_style.dart`

## State Management Rules

- Global providers in `lib/core/provider/`
- Feature-specific providers in feature folders
- Use proper Riverpod patterns (StateNotifier, FutureProvider, etc.)
- Dispose resources properly

## Network Configuration

- All API calls through Dio instance in `core/network/dio.dart`
- Handle interceptors for auth tokens if needed
- Implement proper error handling and retry logic

## Testing Approach

- NO test file generation unless explicitly requested
- Focus on implementation first

## Git Workflow

- Feature branch naming: `feature/#[issue_number]-description`
- Commit messages should be concise and descriptive
- NO commit message documentation

## Environment Configuration

- Use `.env` files for configuration (already set up with flutter_dotenv)
- Access via `dotenv.env['KEY']`

## Asset Management

- Images: `assets/images/`
- Config: `assets/config/`
- Fonts: Already configured

## Build & Run Commands

```bash
# Get dependencies
flutter pub get

# Generate code (for json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs

# Run app
flutter run

# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

## Important Notes

1. Always adapt generated code to match existing patterns in the codebase
2. Maintain consistency with current architecture
3. Do not create documentation unless explicitly requested
4. Focus on clean, working implementation
5. Use existing utilities and helpers where available
