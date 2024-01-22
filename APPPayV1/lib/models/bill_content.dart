import 'package:apppayv1/models/product_line.dart';

class BillingContent {
  late int _id;
  late String _name;
  late String _note;
  late String _code;
  late ProductLine _product_line;

  BillingContent(
      this._id, this._name, this._note, this._code, this._product_line);

  factory BillingContent.fromJson(Map<String, dynamic> json) {
    return BillingContent(json['id'], json['name'] ?? "", json['note'] ?? "",
        json['code'] ?? "", ProductLine.fromJson(json['product_line']));
  }

  ProductLine get productLine => _product_line;

  set productLine(ProductLine value) {
    _product_line = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
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