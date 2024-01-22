class ProductLine {
  late String _id;
  late String _code;
  late String _name;

  ProductLine(this._id, this._code, this._name);

  factory ProductLine.fromJson(Map<String, dynamic> json) {
    return ProductLine(json['id'], json['code'] ?? "", json['name'] ?? "");
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}