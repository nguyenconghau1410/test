import 'package:apppayv1/detail_tariff.dart';
import 'package:apppayv1/models/user.dart';
import 'package:apppayv1/models/user_reciept.dart';
import 'package:flutter/material.dart';

class TariffList extends StatefulWidget {
  List<UserReceipt> listUserReceipt;
  User user;
  TariffList({super.key, required this.listUserReceipt, required this.user});

  @override
  State<TariffList> createState() => _TariffListState();
}

class _TariffListState extends State<TariffList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              widget.listUserReceipt.length,
              (index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailTariff(userReceipt: widget.listUserReceipt[index], user: widget.user,))
                      );
                    },
                    child: _tariffItem(widget.listUserReceipt[index])
                );
              }
          )
        ),
      )
    );
  }

  Widget _tariffItem(UserReceipt userReceipt) {
    bool isPaid = userReceipt.status_payment.code == "unpaid";
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  color: isPaid ? const Color(0xFFFBBB00) : const Color(0xFF5EE57B),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      // spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]
              )
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 46,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Text(userReceipt.receipt.groupReceipt.name, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              color: isPaid ? const Color(0xFFFBBB00) : const Color(0xFF5EE57B),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(child: Text("\$", style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        const SizedBox(width: 8,),
                        Text("${userReceipt.receipt.total_price} VND", style: const TextStyle(fontSize: 16, color: Colors.black54),),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Text("${userReceipt.receipt.start_date} - ${userReceipt.receipt.due_date}", style: const TextStyle(color: Color(0xFF666666), fontSize: 12),),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)
              ),
              child: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,),
            ),
          ),
          Expanded(child: Container()),
          const Text("Danh sách biểu phí", style: TextStyle(fontSize: 20, color: Colors.black),),
          Expanded(child: Container()),
          InkWell(
              onTap: () {

              },
              child: Container(
                width: 55,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      // spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: const Icon(Icons.search_outlined, color: Colors.black,),
              )
          ),
        ],
      ),
    );
  }
}
