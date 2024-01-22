import 'package:apppayv1/models/detail_receipts.dart';
import 'package:apppayv1/models/receipt.dart';
import 'package:apppayv1/models/status_payment.dart';

class UserReceipt {
  late int _id;
  late int _users_id;
  late int _receipts_id;
  late StatusPayment _status_payment;
  late Receipt _receipt;

  UserReceipt(this._id, this._users_id, this._receipts_id, this._status_payment,
      this._receipt);

  factory UserReceipt.fromJson(Map<String, dynamic> json) {
    return UserReceipt(json['id'], json['users_id'], json['receipts_id'],
        StatusPayment.fromJson(json['status_payment']),
        Receipt.fromJson(json['receipt']));
  }

  Receipt get receipt => _receipt;

  set receipt(Receipt value) {
    _receipt = value;
  }

  StatusPayment get status_payment => _status_payment;

  set status_payment(StatusPayment value) {
    _status_payment = value;
  }

  int get receipts_id => _receipts_id;

  set receipts_id(int value) {
    _receipts_id = value;
  }

  int get users_id => _users_id;

  set users_id(int value) {
    _users_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}