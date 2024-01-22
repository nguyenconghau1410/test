import 'package:flutter/material.dart';
import 'package:apppayv1/transfer_money.dart';


class transfer_detail extends StatefulWidget {
  const transfer_detail({super.key});

  @override
  State<transfer_detail> createState() => _transfer_detailState();
}

class _transfer_detailState extends State<transfer_detail> {
  String selectedOption = 'VND';
  var _money_number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          leading: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey)),
            child: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {},
            ),
          ),
          title: const Text(
            'Send Money',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              letterSpacing: 0.3,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(
                        'assets/kit-/images/unsplash-k4a59mzzty-bg.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'to Meo',
                  style: body_small_bold,
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Color.fromRGBO(229, 231, 235, 1),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enter amount',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  height: 1.8,
                                  color: Color.fromRGBO(107, 114, 128, 1)),
                            ),
                            Text("10.000.000 VND", style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  height: 1.8,
                                  color: Color.fromRGBO(107, 114, 128, 1)),)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedOption,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 0,
                            style:  const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  color: Color.fromRGBO(107, 114, 128, 1)),
                            onChanged: (String? newValue) {
                              if (newValue != null &&
                                  ['VND', 'USD', 'CNY'].contains(newValue)) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              }
                            },
                            items: <String>['VND', 'USD', 'CNY']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    200, // Đặt giới hạn chiều rộng của TextField
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _money_number,
                                decoration: const InputDecoration(
                                  labelStyle:  TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.2,
                                  color: Color.fromRGBO(107, 114, 128, 1)),
                                  border: InputBorder.none,
                                ),
                                style:  const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.2,
                                  color: Colors.black),
                                onChanged: (value) {
                                  // Xử lý khi giá trị thay đổi
                                },
                                onSubmitted: (value) {
                                  // Xử lý khi người dùng nhấn "Enter" hoặc hoàn thành nhập liệu
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(47, 162, 185, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          
                        );
                      });
                    },
                    child: Text(
                      'Send Money',
                      style: body_large_bold,
                    )),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
