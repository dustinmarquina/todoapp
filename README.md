# Todo App

A Flutter todo application with local state management and offline storage capabilities.

## Features

- ✅ Add new tasks
- ✅ Mark tasks as complete/incomplete
- ✅ Delete tasks
- ✅ Persistent local storage
- ✅ Clean and intuitive UI

## Technical Stack

- **State Management:** StatefulWidget with setState()
- **UI Components:** ListView.builder()
- **Local Storage:** shared_preferences
- **Architecture:** Simple local state management

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart           # App entry point
├── models/
│   └── task.dart      # Task data model
├── services/
│   └── storage_service.dart  # Local storage service
└── screens/
    └── todo_screen.dart      # Main todo screen
```

## Requirements Met

- ✅ StatefulWidget implementation
- ✅ ListView.builder() for dynamic lists
- ✅ setState() for state management
- ✅ Offline-capable with local storage
