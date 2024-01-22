class Role {
  late int _id;
  late String _name;
  late String _code;

  Role(this._id, this._name, this._code);

  factory Role.fromJson(Map<String, dynamic> json) {
    print(json);
    return Role(json['id'], json['name'] ?? "", json['code'] ?? "" );
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}