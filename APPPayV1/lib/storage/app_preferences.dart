import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? get preferences => _preferences;
}