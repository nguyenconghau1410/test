
import 'package:apppayv1/widgets_utils//card.dart';
import 'package:flutter/material.dart';

class AddingCard extends StatefulWidget {
  const AddingCard({super.key});

  @override
  State<AddingCard> createState() => _AddingCardState();
}

class _AddingCardState extends State<AddingCard> {
  int a = 0xFF2FA2B9;
  int b = 0xFFFBBB00;
  int check = 2;

  var formKey = GlobalKey<FormState>();
  var cardNumber = TextEditingController();
  var expiryDate = TextEditingController();
  var vcc = TextEditingController();
  var cardHolder = TextEditingController();

  String choose = "Country";
  final list = ["Country", "USA", "Canada", "Việt Nam"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
                onTap: () {

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
            const Center(child: Text("Thêm card", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: "Roboto"),)),
            Expanded(child: Container()),
            Container()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 254,
                  color: const Color(0xFFF3F4F6),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(child: CardUtils.card2(a, b),),
                ),
                Positioned(
                  right: 0,
                  top: 64,
                  child: Container(
                    height: 134,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              check = 1;
                              a = 0xFF2FA2B9;
                              b = 0XFFFFB9AA;
                            });
                          },
                          child: check == 1 ? __checkButton("18276") : Image.asset("images/18276.png", width: 24, height: 24,),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check = 2;
                              a = 0xFF2FA2B9;
                              b = 0xFFFBBB00;
                            });
                          },
                          child: check == 2 ? __checkButton("18277") : Image.asset("images/18277.png", width: 24, height: 24,),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check = 3;
                              a = 0xFFFBBB00;
                              b = 0xFFFFB9AA;
                            });
                          },
                          child: check == 3 ? __checkButton("color") : Image.asset("images/color.png", width: 30, height: 30,),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 32),
              child: Text("Card Detail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF2FA2B9)),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 4),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    __customInputField("Card number", "Hãy nhập Card number", "images/Mastercard.png", cardNumber),
                    Row(
                      children: [
                        Expanded(child: __customInputField("Expiry date", "Hãy nhập Expiry date", "", expiryDate),),
                        const SizedBox(width: 10,),
                        Expanded(child: __customInputField("VCC", "Hãy nhập VCC", "", vcc))

                      ],
                    ),
                    __customInputField("Card holder", "Hãy nhập Card holder", "", cardHolder),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: DropdownButton(
                          hint: const Text("Country"),
                          isExpanded: true,
                          underline: Container(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          value: choose,
                          onChanged: (newValue) {
                            setState(() {
                              choose = newValue!;
                            });
                          },
                          items: list.map((newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text(newValue),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFF2FA2B9)
                        ),
                        child: const Center(child: Text("Thêm", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget __checkButton(String path) {
    return Stack(
      children: [
        Image.asset("images/$path.png", width: 24, height: 24,),
        Positioned(
          top: 5,
          left: 5,
          child: Image.asset("images/check.png", width: 14, height: 14,),
        )
      ],
    );
  }
  Widget __customInputField(String hint, String err, String path, var controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        validator: (val) => val == "" ? err : null,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: path == "" ? null : Image.asset(path, width: 32, height: 24,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white60,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white60,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white60,
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white60,
              )
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          fillColor: const Color(0xFFF9FAFB),
          filled: true,
        ),
      ),
    );
  }
}
// <String>[]
// .map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value, style: const TextStyle(color: Colors.black54),)
// );
// }).toList(),
