import 'package:apppayv1/models/information_settings.dart';
import 'package:apppayv1/models/ref_code.dart';
import 'package:apppayv1/models/roles.dart';
import 'package:apppayv1/models/users.dart';

class Account {
  late int _id;
  late String _user_name;
  late String _email;
  late Roles _roles;
  late RefCode _ref_code;
  late Users _users;
  late InformationSettings _information_settings;
  late String _name;

  factory Account.fromJson(Map<String, dynamic> jsonRequest) {
    Map<String, dynamic> json = jsonRequest['data'][0];
    return Account(json['id'], json['user_name'] ?? "", json['email'] ?? "",
        Roles.fromJson(json['roles']), RefCode.fromJson(json['ref_code']),
        Users.fromJson(json['users']), InformationSettings.fromJson(json['information_settings']),
        json['name']);
  }

  Account(this._id, this._user_name, this._email, this._roles, this._ref_code,
      this._users, this._information_settings, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  InformationSettings get information_settings => _information_settings;

  set information_settings(InformationSettings value) {
    _information_settings = value;
  }

  Users get users => _users;

  set users(Users value) {
    _users = value;
  }

  RefCode get ref_code => _ref_code;

  set ref_code(RefCode value) {
    _ref_code = value;
  }

  Roles get roles => _roles;

  set roles(Roles value) {
    _roles = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get user_name => _user_name;

  set user_name(String value) {
    _user_name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}