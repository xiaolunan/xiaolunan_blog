# AGENTS.md - Flutter Web Blog Project

## Build Commands

```bash
# Run development server
flutter run -d chrome

# Build for production
flutter build web

# Build with release mode
flutter build web --release

# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade
```

## Lint Commands

```bash
# Analyze code for issues
flutter analyze

# Format all Dart files
dart format .

# Format specific file
dart format lib/main.dart

# Check formatting without making changes
dart format --output=none --set-exit-if-changed .
```

## Test Commands

```bash
# Run all tests
flutter test

# Run single test file
flutter test test/widget_test.dart

# Run specific test by name
flutter test --name="Counter increments"

# Run tests with coverage
flutter test --coverage

# Run tests in specific directory
flutter test test/

# Run tests with verbose output
flutter test -v
```

## Code Style Guidelines

### Imports
- Use `package:` imports for external dependencies
- Use relative imports for local files within lib/
- Group imports: Dart SDK → Flutter → Third-party → Local
- Sort imports alphabetically within groups

```dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';

import 'models/article.dart';
import 'services/api_client.dart';
```

### Formatting
- Use 2 spaces for indentation
- Maximum line length: 80 characters
- Use trailing commas for multi-line parameter lists
- Use single quotes for strings (prefer_single_quotes: true)

### Naming Conventions
- **Classes/Pages**: PascalCase (e.g., `ArticleDetailPage`, `LoginScreen`)
- **Files**: snake_case (e.g., `article_detail_page.dart`)
- **Variables/Functions**: camelCase (e.g., `getArticleList`, `userName`)
- **Constants**: camelCase for local, PascalCase for enum values
- **Private members**: Prefix with underscore (e.g., `_counter`, `_fetchData`)

### Types
- Always specify types for public APIs
- Use `final` for variables that don't change
- Use `const` for compile-time constants
- Prefer `var` with type inference for local variables when type is obvious
- Use nullable types (`String?`) appropriately

```dart
// Good
final String articleId;
const double padding = 16.0;
final articles = <Article>[];

// Avoid
var articleId = '123'; // Type is clear but prefer explicit for public
```

### Widget Guidelines
- Use `const` constructors when possible
- Pass `Key` to widgets for testing
- Keep widget classes small and focused
- Extract reusable widgets into separate files

```dart
class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  
  final Article article;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(article.title),
      ),
    );
  }
}
```

### State Management
- Prefer stateless widgets when possible
- Use StatefulWidget for local state
- Use Provider/Riverpod for app-wide state (to be added)
- Keep business logic out of widgets

### Error Handling
- Use try-catch for async operations
- Always handle potential null values
- Provide user-friendly error messages
- Log errors for debugging

```dart
try {
  final response = await apiClient.get('/articles');
  return Article.fromJson(response.data);
} catch (e) {
  debugPrint('Failed to load articles: $e');
  throw Exception('无法加载文章列表');
}
```

### Comments
- Use `///` for documentation comments
- Use `//` for inline comments
- Avoid obvious comments
- Document complex business logic

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # App configuration
├── config/
│   ├── api_config.dart       # API endpoints
│   ├── routes.dart           # Route definitions
│   └── theme.dart            # App theme
├── models/                   # Data models
├── services/                 # API services
├── providers/                # State management
├── screens/                  # Page screens
│   ├── home/
│   ├── article/
│   ├── auth/
│   ├── profile/
│   └── admin/
├── widgets/                  # Reusable widgets
├── utils/                    # Utilities
└── middleware/               # Route guards
```

## Lint Rules

This project uses `flutter_lints` package. Key rules:
- `avoid_print`: Use debugPrint instead of print
- `prefer_single_quotes`: Use single quotes for strings
- `always_use_package_imports`: Consistent import style
- `avoid_relative_lib_imports`: No relative imports from lib/

## Backend Server Information

### Server Overview
- **Project**: SobBlogSystemDemo
- **Technology**: Java 17 + Spring Boot 2.7.18
- **Build Tool**: Maven
- **Database**: MySQL 5.7
- **Cache**: Redis 7.0
- **Authentication**: JWT tokens with Spring Security
- **Documentation**: Swagger/OpenAPI

### Development Environment

**Docker Containers (Development)**

| Container | Image | Port | Name |
|-----------|-------|------|------|
| Redis | redis:7.0.14 | 6379:6379 | sob-blog-system-redis |
| MySQL | mysql:5.7.30 | 3306:3306 | sob-blog-system-mysql |

```bash
# Start containers
docker start sob-blog-system-redis sob-blog-system-mysql

# Stop containers
docker stop sob-blog-system-redis sob-blog-system-mysql
```

### Production Environment (Cloud Server)

- **Provider**: 阿里云 ECS
- **OS**: Ubuntu 22.04 LTS
- **Configuration**: 2 vCPU, 2 GiB RAM
- **Hostname**: iZbp1jcv0f3ml1wyl8ugwiZ

**API Base URL**: `http://<server-ip>:8080`
- Application Port: 8080
- Database Port: 3306 (MySQL)
- Cache Port: 6379 (Redis)

**Docker Containers (Production)**

| Container | Image | Port Mapping | Name | Status |
|-----------|-------|--------------|------|--------|
| Application | sob-blog-system_app | 0.0.0.0:8080->8080/tcp | sob-blog-system-app | Running |
| Redis | docker.m.daocloud.io/redis:7.0-alpine | 0.0.0.0:6379->6379/tcp | sob-blog-system-redis | Running |
| MySQL | docker.m.daocloud.io/mysql:5.7.44 | 0.0.0.0:3306->3306/tcp | sob-blog-system-mysql | Running |

**Production Container Management**

```bash
# SSH into the server
ssh root@<server-ip>

# View running containers
docker ps

# View specific container logs
docker logs sob-blog-system-app
docker logs sob-blog-system-redis
docker logs sob-blog-system-mysql

# Restart application container
docker restart sob-blog-system-app

# Stop all containers
docker stop sob-blog-system-app sob-blog-system-redis sob-blog-system-mysql

# Start all containers
docker start sob-blog-system-mysql sob-blog-system-redis sob-blog-system-app
```

## Additional Notes

- Target platform: Flutter Web
- Dart SDK: ^3.8.0
- Backend: Spring Boot REST API (Port 8080)
- Authentication: JWT Token
- Database: MySQL 5.7 (Port 3306)
- Cache: Redis 7.0 (Port 6379)
- Follow Flutter official style guide: https://docs.flutter.dev/development/tools/formatting
