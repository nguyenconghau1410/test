class Customer {
  late int _id;
  late String _code;
  late String _name;
  late String _start_date;


  Customer(this._id, this._code, this._name, this._start_date);

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(json['id'], json['code'] ?? "", json['name'] ?? "", json['start_date'] ?? "");
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get code => _code;

  String get start_date => _start_date;

  set start_date(String value) {
    _start_date = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  set code(String value) {
    _code = value;
  }
}