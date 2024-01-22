import 'package:apppayv1/models/detail_receipt.dart';
import 'package:apppayv1/models/user.dart';
import 'package:apppayv1/models/user_reciept.dart';
import 'package:flutter/material.dart';

class DetailTariff extends StatefulWidget {
  UserReceipt userReceipt;
  User user;
  DetailTariff({super.key, required this.userReceipt, required this.user});

  @override
  State<DetailTariff> createState() => _DetailTariffState();
}

class _DetailTariffState extends State<DetailTariff> {
  List<DetailReceipt> list = [];
  
  @override
  void initState() {
    super.initState();
    list = widget.userReceipt.receipt.detail_receipts.detail_reciepts;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(child: Text(widget.userReceipt.receipt.groupReceipt.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)),
              const SizedBox(height: 30,),
              const Text("Thông tin chung", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF6B7280)),),
              const SizedBox(height: 24,),
              _information(widget.user.department.customer.name, widget.user.department.name, widget.user.name, widget.user.code),
              const SizedBox(height: 24,),
              const Text("Các khoảng phí", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF6B7280)),),
              const SizedBox(height: 24,),
              _fees(list)
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomAppBar(widget.userReceipt.receipt.total_price, widget.userReceipt.status_payment.code),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)
                ),
                child: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,),
              )
          ),
          Expanded(child: Container()),
          const Center(child: Text("Danh sách biểu phí", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),)),
          Expanded(child: Container()),
          Container()
        ],
      ),
    );
  }
  Widget _bottomAppBar(String total_price, String code) {
    return BottomAppBar(
        height: 66,
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, right: 10),
                    child: Text("Tổng cộng", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Text("$total_price VND", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
            ),
            _button(code)
          ],
        )
    );
  }
  Widget _information(String school, String department, String name, String identity) {
    return Container(
      width: MediaQuery.of(context).size.width - 46,
      height: 208,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Trường", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6B7280)),),
                Expanded(child: Container()),
                Text(school, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0XFF1A1A1A)),)
              ],
            ),
            Expanded(child: Container()),
            Row(
              children: [
                const Text("Lớp", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6B7280)),),
                Expanded(child: Container()),
                Text(department, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0XFF1A1A1A)),)
              ],
            ),
            Expanded(child: Container()),
            Row(
              children: [
                const Text("Họ và Tên", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6B7280)),),
                Expanded(child: Container()),
                Text(name == "" ? identity : name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0XFF1A1A1A)),)
              ],
            ),
            Expanded(child: Container()),
            Row(
              children: [
                const Text("Mã học sinh", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6B7280)),),
                Expanded(child: Container()),
                Text(identity, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0XFF1A1A1A)),)
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _fees(List<DetailReceipt> list) {
    return Container(
      width: MediaQuery.of(context).size.width - 46,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Column(
          children: List.generate(
            list.length,
              (index) => _itemFee(
                  list[index].productType.billing_content.name,
                  list[index].productType.price
              )
          )
        ),
      ),
    );
  }
  Widget _itemFee(String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        children: [
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6B7280)),),
          Expanded(child: Container()),
          Text("$price VND", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0XFF1A1A1A)),)
        ],
      ),
    );
  }
  Widget _button(String code) {
    bool isPaid = code == "unpaid";
    return isPaid ? Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      child: InkWell(
          onTap: () {

          },
          child: Container(
            height: 66,
            width: 132,
            decoration: const BoxDecoration(
                color: Color(0xFF0085FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            child: const Center(child: Text("Đóng phí", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
          )
      ),
    ) : Container();
  }
}
