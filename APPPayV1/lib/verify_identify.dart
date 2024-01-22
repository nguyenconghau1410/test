import 'package:flutter/material.dart';
import 'package:apppayv1/frame.dart';

class VerifyIdentify extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerifyIdentify();
  }
}

class _VerifyIdentify extends State<VerifyIdentify>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Frame())),
              child: Image.asset('images/Frame 966.png'),
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
            const SizedBox(height: 16),
            const Text(
              'Confirm your identity',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: -.2,
                color: Color.fromRGBO(47, 162, 185, 1)
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'We’re required by law to verify your identity before we can use your money',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: .3,
                color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 8),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              margin: const EdgeInsets.symmetric(horizontal: 68),
              // decoration: const BoxDecoration(
              //   color: Colors.blue
              // ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/Group 18270.png',
                      // color: Colors.transparent,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2, color: Color.fromRGBO(29, 171, 135, 1))
                      ),

                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(29, 171, 135, .5),
                          Color.fromRGBO(221, 244, 238, .3),
                        ]
                      )
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('images/Vector 35.png'),
                  ),
                  
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('images/Vector 33.png'),
                  ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset('images/Vector 36.png'),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('images/Vector 34.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: (){
            print('Open Camera');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(47, 162, 185, 1),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          child: const Text(
            'Verify Identity',
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