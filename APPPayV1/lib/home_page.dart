import 'dart:io';

import 'package:apppayv1/API/get_api.dart';
import 'package:apppayv1/detail_tariff.dart';
import 'package:apppayv1/models/account.dart';
import 'package:apppayv1/models/receipt.dart';
import 'package:apppayv1/models/user.dart';
import 'package:apppayv1/models/user_reciept.dart';
import 'package:apppayv1/notification.dart';
import 'package:apppayv1/profile.dart';
import 'package:apppayv1/storage/app_preferences.dart';
import 'package:apppayv1/tariff_list.dart';
import 'package:apppayv1/user_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget {
  String user_name;
  HomePage({super.key, required this.user_name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? selectedUser;
  List<User> list = [];
  Future<Account>? _getAccount;

  Future<List<UserReceipt>>? _getUserReceipt;
  List<UserReceipt>? listUserReceipt1;
  Account? account1;
  late Future<Map<String, dynamic>> _data;
  late AppPreferences _appPreferences;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
    _appPreferences = AppPreferences();
    _appPreferences.init();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final String? imagePath = _appPreferences.preferences?.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _image = XFile(imagePath);
      });
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final account = await APIService.getAccount(widget.user_name);
      list = account.users.user;
      selectedUser = list[0];
      _getUserReceipt = APIService.getUserReceipt(selectedUser!.id);
      final totalPrice = await APIService.getTotalPrice(account.id);
      final notifications = await APIService.getNotificationUnread();
      return {
        "accounts_data": account,
        "totalPrice_data": totalPrice,
        "notifications": notifications!['data']
      };
    }
    catch(e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }
        else if(snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')),);
        }
        else {
          final data = snapshot.data;
          final account = data!['accounts_data'];
          account1 = account;
          final total = data!['totalPrice_data'];
          final count = data!['notifications'];
          String name = account!.name;
          String role = account.roles.role[0].name;
          Future<Map<String, dynamic>> getTotal = APIService.getTotalPrice(account!.id);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    __appBar(name, role, list, account, count),
                    const SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 251,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF2FA2B9).withOpacity(0.4)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13, top: 13, bottom: 13),
                        child: Column(
                          children: [
                            __item("Số tiền cần đóng", "${total!['unpaid']}đ", "images/FinanceIcons1.png"),
                            Expanded(child: Container()),
                            __item("Số tiền đã đóng", "${total!['paid']}đ", "images/FinanceIcons.png"),
                            Expanded(child: Container()),
                            __item("Số biểu phí phải đóng", "${total!['amount_receipt']}", "images/Group18279.png")
                          ],
                        ),
                      )
                    ),
                    _itemUI(_getUserReceipt!),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _bottomApp(),
          );
        }
      },
    );
  }

  Widget __appBar(String name, String role, List<User> list, Account account, int count) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$name - $role", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter", color: Color(0xFF666666)),),
            const SizedBox(height: 5,),
            _dropDownListUser(list)
          ],
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Notifications())
            );
          },
          child: Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFD4D4D4))
                ),
                child: const Icon(Icons.notifications_none, size: 24,),
              ),
              Positioned(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFBBB00)
                  ),
                  child: Center(child: Text(count.toString(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(account: account,))
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: _image == null
                  ? Image.asset("images/user.jpg", width: 48, height: 48,fit: BoxFit.fill)
                  : Image.file(File(_image!.path), width: 48, height: 48, fit: BoxFit.fill,),
          )
        )
      ],
    );
  }

  Widget _dropDownListUser(List<User> list) {
    return DropdownButton(
      isDense: true,
      dropdownColor: Colors.white,
      underline: Container(),
      icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black, size: 20,),
      value: selectedUser,
      onChanged: (newValue) {
        setState(() {
          selectedUser = newValue;
          _getUserReceipt = APIService.getUserReceipt(selectedUser!.id);
        });
      },
      items: list.map((e) {
        return DropdownMenuItem<User>(
          value: e,
          child: Text(e.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        );
      }).toList(),
    );
  }
  Widget _itemUI(Future<List<UserReceipt>> _getUserReceipt) {
    return FutureBuilder(
      future: _getUserReceipt,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError) {
          return  Center(child: Text('Error: ${snapshot.error}'));
        }
        else {
          final listUserReceipt = snapshot.data;
          listUserReceipt1 = listUserReceipt;
          return Column(
            children: [
              const SizedBox(height: 30,),
              Column(
                  children: List.generate(
                      listUserReceipt!.length > 4 ? 4 : listUserReceipt.length,
                      (index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailTariff(userReceipt: listUserReceipt[index], user: selectedUser!,))
                              );
                            },
                            child: _tariffItem(listUserReceipt[index])
                        );
                      }
                  )
              ),
            ],
          );
        }
      },
    );
  }
  Widget _tariffItem(UserReceipt userReceipt) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  color: userReceipt!.status_payment.code == "unpaid" ? const Color(0xFFFBBB00) : const Color(0xFF5EE57B),
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
              width: MediaQuery.of(context).size.width - 50,
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
                              color: userReceipt!.status_payment.code == "unpaid" ? const Color(0xFFFBBB00) : const Color(0xFF5EE57B),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(child: Text("\$", style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                        const SizedBox(width: 8,),
                        Text("${userReceipt.receipt.total_price} VND" , style: const TextStyle(fontSize: 16, color: Colors.black54),),
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

  Widget __item(String text, String money, String path) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 67.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: const TextStyle(fontSize: 14.8, fontWeight: FontWeight.w500),),
                Expanded(child: Container()),
                Text(money, style: const TextStyle(fontSize: 12.12, fontWeight: FontWeight.w500, color: Color(0xFF666666)))
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(path, width: 41, height: 41,),
          )
        ],
      ),
    );
  }

  Widget _bottomApp() {
    return BottomAppBar(
      height: 60  ,
      child: Row(
        children: [
          Expanded(child: Container()),
          Image.asset("images/home.png"),
          Expanded(child: Container()),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TariffList(listUserReceipt: listUserReceipt1!, user: selectedUser!,))
                );
              },
              child: Image.asset("images/file-text.png")
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserRequest(account: account1!,))
              );
            },
            child: const Icon(Icons.info_outline, size: 32, color: Color(0xC8A3A3A3),),
          ),
          Expanded(child: Container()),
        ],

      ),
    );
  }
}
