# Quick Start Guide

## 🚀 Running the App

### Prerequisites
- Flutter SDK installed
- An IDE (VS Code, Android Studio, or IntelliJ)
- An emulator or physical device

### Steps to Run

1. **Navigate to the project directory:**
   ```bash
   cd "/Users/mac/Downloads/6th Semester/Machine Learning/Python/Sem7th/Flutter/Todo App"
   ```

2. **Get dependencies (already done):**
   ```bash
   flutter pub get
   ```

3. **Check available devices:**
   ```bash
   flutter devices
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

   Or for a specific device:
   ```bash
   flutter run -d <device-id>
   ```

## 📱 Using the App

### Adding a Task
1. Tap the **+** floating action button
2. Enter your task title in the dialog
3. Press **Add** or hit Enter

### Completing a Task
- Tap the checkbox next to a task
- Or tap anywhere on the task card

### Deleting a Task
- **Option 1:** Swipe the task card from right to left
- **Option 2:** Tap the delete icon on the right side of the task
- Confirm deletion in the dialog

### Features Overview
- ✅ **Task Counter:** See completed/total tasks in the app bar
- ✅ **Timestamps:** View when each task was created
- ✅ **Persistent Storage:** Tasks are saved automatically and persist between app restarts
- ✅ **Visual Feedback:** Completed tasks are shown with strikethrough text
- ✅ **Empty State:** Helpful message when no tasks exist

## 🏗️ Architecture

### State Management
- Uses `StatefulWidget` with `setState()` for local state management
- All state changes trigger UI updates automatically

### Local Storage
- `shared_preferences` package for persistent storage
- Automatic saving on every CRUD operation
- Data survives app restarts and device reboots

### File Structure
```
lib/
├── main.dart                      # App entry point
├── models/
│   └── task.dart                 # Task data model
├── services/
│   └── storage_service.dart      # Local storage operations
└── screens/
    └── todo_screen.dart          # Main UI screen
```

## 🔧 Technical Implementation

### Key Flutter Concepts Used

1. **StatefulWidget**
   - `TodoScreen` is a StatefulWidget
   - Manages mutable state with `_TodoScreenState`

2. **ListView.builder()**
   - Efficiently renders dynamic list of tasks
   - Only builds visible items

3. **setState()**
   - Triggers UI rebuilds when data changes
   - Used for add, update, delete operations

4. **Dismissible Widget**
   - Enables swipe-to-delete functionality
   - Provides smooth animations

5. **Async/Await**
   - Handles asynchronous storage operations
   - Prevents UI blocking

## 📝 Code Examples

### Adding a Task
```dart
final newTask = Task(
  id: DateTime.now().millisecondsSinceEpoch.toString(),
  title: title.trim(),
);

setState(() {
  _tasks.add(newTask);
});

await _storageService.saveTasks(_tasks);
```

### Toggling Completion
```dart
setState(() {
  final index = _tasks.indexWhere((task) => task.id == taskId);
  if (index != -1) {
    _tasks[index] = _tasks[index].copyWith(
      isCompleted: !_tasks[index].isCompleted,
    );
  }
});

await _storageService.saveTasks(_tasks);
```

## 🎨 Customization Ideas

1. **Add Task Categories**
   - Add a category field to Task model
   - Filter tasks by category

2. **Task Priorities**
   - Add priority levels (high, medium, low)
   - Sort by priority

3. **Due Dates**
   - Add deadline functionality
   - Show overdue tasks differently

4. **Search & Filter**
   - Add search bar
   - Filter by completed/incomplete

5. **Themes**
   - Add dark mode
   - Custom color schemes

## 🐛 Troubleshooting

### App doesn't start
- Run `flutter doctor` to check setup
- Ensure device/emulator is running

### Tasks not persisting
- Check device storage permissions
- Verify shared_preferences is installed

### Build errors
- Run `flutter clean`
- Run `flutter pub get`
- Restart IDE

## 📚 Learning Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [StatefulWidget Guide](https://flutter.dev/docs/development/ui/interactive)
- [ListView.builder Documentation](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [shared_preferences Package](https://pub.dev/packages/shared_preferences)

---

Enjoy building with Flutter! 🎉
