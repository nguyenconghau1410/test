class RefCode {
  late int _id;
  late String _value;
  late String _code;
  late String _type;

  RefCode(this._id, this._value, this._code, this._type);

  factory RefCode.fromJson(Map<String, dynamic> json) {
    print(json);
    return RefCode(json['id'], json['value']?? "", json['code']?? "", json['type']?? "");
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get value => _value;

  set value(String value) {
    _value = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}