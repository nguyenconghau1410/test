import 'dart:math';

import 'package:apppayv1/models/role.dart';

class Roles {
  late List<Role> _roles;

  Roles(this._roles);

  factory Roles.fromJson(List<dynamic> json) {
    List<Role> roles = [];
    print(json);
    json.forEach((element) {
      roles.add(Role.fromJson(element));
    });
    return Roles(roles);
  }

  List<Role> get role => _roles;

  set role(List<Role> value) {
    _roles = value;
  }
}