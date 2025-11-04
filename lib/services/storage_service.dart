import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

/// Service for managing local storage of tasks
class StorageService {
  static const String _tasksKey = 'tasks';

  /// Saves the list of tasks to local storage
  Future<bool> saveTasks(List<Task> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> tasksJson = tasks
          .map((task) => json.encode(task.toJson()))
          .toList();
      return await prefs.setStringList(_tasksKey, tasksJson);
    } catch (e) {
      print('Error saving tasks: $e');
      return false;
    }
  }

  /// Loads the list of tasks from local storage
  Future<List<Task>> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? tasksJson = prefs.getStringList(_tasksKey);
      
      if (tasksJson == null || tasksJson.isEmpty) {
        return [];
      }

      return tasksJson
          .map((taskString) => Task.fromJson(json.decode(taskString) as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error loading tasks: $e');
      return [];
    }
  }

  /// Clears all tasks from local storage
  Future<bool> clearTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_tasksKey);
    } catch (e) {
      print('Error clearing tasks: $e');
      return false;
    }
  }

  /// Adds a single task to storage
  Future<bool> addTask(Task task) async {
    final tasks = await loadTasks();
    tasks.add(task);
    return await saveTasks(tasks);
  }

  /// Updates a single task in storage
  Future<bool> updateTask(Task updatedTask) async {
    final tasks = await loadTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    
    if (index != -1) {
      tasks[index] = updatedTask;
      return await saveTasks(tasks);
    }
    
    return false;
  }

  /// Deletes a single task from storage
  Future<bool> deleteTask(String taskId) async {
    final tasks = await loadTasks();
    tasks.removeWhere((task) => task.id == taskId);
    return await saveTasks(tasks);
  }
}
