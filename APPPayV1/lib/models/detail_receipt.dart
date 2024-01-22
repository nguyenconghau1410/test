import 'package:apppayv1/models/product_type.dart';

class DetailReceipt {
  late int _id;
  late int _receipts_id;
  late int _amount;
  late String _total_price;
  late ProductType _product_type;

  DetailReceipt(this._id, this._receipts_id, this._amount, this._total_price,
      this._product_type);
  
  factory DetailReceipt.fromJson(Map<String, dynamic> json) {
    return DetailReceipt(json['id'], json['receipts_id'], json['amount'],
        json['total_price'] ?? "", ProductType.fromJson(json['product_type']));
  }

  ProductType get productType => _product_type;

  set productType(ProductType value) {
    _product_type = value;
  }

  String get total_price => _total_price;

  set total_price(String value) {
    _total_price = value;
  }

  int get amount => _amount;

  set amount(int value) {
    _amount = value;
  }

  int get reciepts_id => _receipts_id;

  set reciepts_id(int value) {
    _receipts_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}