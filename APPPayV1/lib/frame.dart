import 'package:flutter/material.dart';
import 'package:apppayv1/home_page.dart';
import 'package:apppayv1/verify_identify.dart';

class Frame extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FrameState();
  }
}

class _FrameState extends State<Frame>{
  List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());
  int _cnt = 0;
  double _pd = 34;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)
                ),
                child: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,),
              ),
            )
          ]
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Text(
              'Confirm PIN code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: -.2,
                color: Color.fromRGBO(47, 162, 185, 1)
              ),
            ),

            const Text(
              'We use state-of-the-art security measures to protect your information at all times',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: .3,
                color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),

            Row(
              children:_controllers.map((item) {
                _cnt += 1;
                if(_cnt == 5){
                  _pd = 0;
                }
                return Container(
                  margin: EdgeInsets.only(right: _pd),
                  width: 50.0,
                  child: TextField(
                    controller: item,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: '', // Ẩn đêm số lượng
                      labelStyle: TextStyle(color: Colors.red),
                    ),

                    onChanged: (value){
                      if(value.isNotEmpty){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => VerifyIdentify())
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(47, 162, 185, 1),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          child: const Text(
            'Create PIN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: .3
            ),
          )
        )
      )
    );
  }
}