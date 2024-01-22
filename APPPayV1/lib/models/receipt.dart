import 'package:apppayv1/models/detail_receipts.dart';
import 'package:apppayv1/models/group_receipt.dart';

class Receipt {
  late int _id;
  late String _total_price;
  late String _start_date;
  late String _due_date;
  late GroupReceipt _group_receipt;
  late DetailReceipts _detail_receipts;

  Receipt(this._id, this._total_price, this._start_date, this._due_date,
      this._group_receipt, this._detail_receipts);

  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(json['id'], json['total_price'] ?? "", json['start_date'] ?? "",
        json['due_date'] ?? "", GroupReceipt.fromJson(json['group_receipt']),
        DetailReceipts.fromJson(json['detail_receipts']));
  }


  DetailReceipts get detail_receipts => _detail_receipts;

  set detail_receipts(DetailReceipts value) {
    _detail_receipts = value;
  }

  GroupReceipt get groupReceipt => _group_receipt;

  set groupReceipt(GroupReceipt value) {
    _group_receipt = value;
  }

  String get due_date => _due_date;

  set due_date(String value) {
    _due_date = value;
  }

  String get start_date => _start_date;

  set start_date(String value) {
    _start_date = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  GroupReceipt get group_receipt => _group_receipt;

  set group_receipt(GroupReceipt value) {
    _group_receipt = value;
  }

  String get total_price => _total_price;

  set total_price(String value) {
    _total_price = value;
  }
}