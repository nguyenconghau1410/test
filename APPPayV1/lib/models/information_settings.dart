class InformationSettings {
  late int _id;
  late String _name;
  late String _birthdate;
  late String _address;

  InformationSettings(this._id, this._name, this._birthdate, this._address);

  factory InformationSettings.fromJson(Map<String, dynamic> json) {
    return InformationSettings(json['id'], json['name'] ?? "", json['birthdate'] ?? "", json['address'] ?? "");
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get birthdate => _birthdate;

  set birthdate(String value) {
    _birthdate = value;
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