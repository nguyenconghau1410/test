class GroupReceipt {
  late int _id;
  late String _name;

  GroupReceipt(this._id, this._name);

  factory GroupReceipt.fromJson(Map<String, dynamic> json) {
    return GroupReceipt(json['id'], json['name'] ?? "");
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