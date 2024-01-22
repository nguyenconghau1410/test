
import 'package:apppayv1/models/detail_receipt.dart';

class DetailReceipts {
  late List<DetailReceipt> _detail_receipts;

  DetailReceipts(this._detail_receipts);

  factory DetailReceipts.fromJson(List<dynamic> jsonList) {
    List<DetailReceipt> list = [];
    jsonList.forEach((element) {
      list.add(DetailReceipt.fromJson(element));
    });
    return DetailReceipts(list);
  }

  List<DetailReceipt> get detail_reciepts => _detail_receipts;

  set detail_reciepts(List<DetailReceipt> value) {
    _detail_receipts = value;
  }
}