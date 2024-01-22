import 'package:apppayv1/models/bill_content.dart';

class ProductType {
  late int _id;
  late String _price;
  late String _discount;
  late int _billing_contents_id;
  late BillingContent _billing_content;

  ProductType(this._id, this._price, this._discount, this._billing_contents_id,
      this._billing_content);

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(json['id'], json['price'] ?? "", json['discount'] ?? "",
        json['billing_contents_id'], BillingContent.fromJson(json['billing_content']));
  }

  BillingContent get billing_content => _billing_content;

  set billing_content(BillingContent value) {
    _billing_content = value;
  }


  int get billing_contents_id => _billing_contents_id;

  set billing_contents_id(int value) {
    _billing_contents_id = value;
  }

  String get discount => _discount;

  set discount(String value) {
    _discount = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}