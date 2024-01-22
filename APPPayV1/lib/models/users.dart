import 'package:apppayv1/models/user.dart';

class Users {
  late List<User> _users;

  Users(this._users);

  factory Users.fromJson(List<dynamic> json) {
    List<User> users= [];
    json.forEach((element) {
      users.add(User.fromJson(element));
    });
    return Users(users);
  }

  List<User> get user => _users;

  set user(List<User> value) {
    _users = value;
  }
}