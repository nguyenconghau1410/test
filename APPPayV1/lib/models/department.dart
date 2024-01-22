import 'package:apppayv1/models/customer.dart';

class Department {
  late int _id;
  late String _code;
  late String _name;
  late int _customers_id;
  late Customer _customer;

  Department(
      this._id, this._code, this._name, this._customers_id, this._customer);

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(json['id'], json['code'] ?? "", json['name'] ?? "", json['customers_id'], Customer.fromJson(json['customer']));
  }

  Customer get customer => _customer;

  set customer(Customer value) {
    _customer = value;
  }

  int get customers_id => _customers_id;

  set customers_id(int value) {
    _customers_id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}