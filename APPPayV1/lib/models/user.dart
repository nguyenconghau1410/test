import 'package:apppayv1/models/department.dart';

import 'information_settings.dart';

class User {
  late int _id;
  late String _name;
  late String _code;
  late int _departments_id;
  late int _accounts_id;
  late Department _department;
  late InformationSettings _information_settings;

  User(this._id, this._name, this._code, this._departments_id,
      this._accounts_id, this._department, this._information_settings);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['name'] ?? "",
        json['code'] ?? "", json['departments_id'], json['accounts_id'], Department.fromJson(json['department']),
    InformationSettings.fromJson(json['information_settings']));
  }


  InformationSettings get information_settings => _information_settings;

  set information_settings(InformationSettings value) {
    _information_settings = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Department get department => _department;

  set department(Department value) {
    _department = value;
  }

  int get accounts_id => _accounts_id;

  set accounts_id(int value) {
    _accounts_id = value;
  }

  int get departments_id => _departments_id;

  set departments_id(int value) {
    _departments_id = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }
}
