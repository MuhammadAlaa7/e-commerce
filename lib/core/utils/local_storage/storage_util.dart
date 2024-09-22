import 'package:hive/hive.dart';

/// A singleton class using hive to store and retrieve data
class AppLocalStorage {
  Box? _box;
  /* 
   This way, the _box can be safely opened and closed, and there’s no risk 
   of re-initialization errors.
   It allows flexibility to handle multiple sessions
   without running into conflicts with Hive’s initialization state.
    */

  // Singleton instance  >> the only instance will be created
  static AppLocalStorage? _instance;

  // Private internal constructor >>> to not be accessed directly from outside the class
  // this creates the singleton instance
  AppLocalStorage._internal();

  // Factory named constructor that ensures a single instance is created
  // it controls the creation of the singleton instance
  // if the instance already exists, it returns the existing instance stored in the _instance variable
  factory AppLocalStorage.instance() {
    // if _instance is null, create a new instance , it means this is the first time the instance is created
    _instance ??= AppLocalStorage._internal();
    return _instance!;
  }

  // Initialization method that uses the singleton instance
  // this is the method that will be triggered first
  // I use this to open a box for each user in the app to store its own data by its id
  // the box name will be the id of each user
  static Future<void> init(String boxName) async {
    final instance = AppLocalStorage.instance();
    instance._box = await Hive.openBox(boxName);
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _box?.put(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _box?.get(key);
  }

  // Method to delete a specific key
  Future<void> deleteData(String key) async {
    await _box?.delete(key);
  }

  // Method to clear all data from the box
  Future<void> clearAllData() async {
    await _box?.clear();
  }

  // Method to close the box (useful when the app is shutting down)
  Future<void> closeBox() async {
    await _box?.close();
  }
}
