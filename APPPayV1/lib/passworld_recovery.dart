import 'package:flutter/material.dart';
import 'package:apppayv1/reset_your_password.dart';

class Recovery extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RecoveryState();
  }
}

class _RecoveryState extends State<Recovery>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 102,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(29, 171, 135, 1)
              ),
              child: Image.asset(
                'images/Path 198.png'
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              'Check your identify',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing:  -.2,
                color: Color.fromRGBO(47, 162, 185, 1)
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Enter the code ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: .3,
                color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),
            const SizedBox(height: 16),

            const TextField(
              decoration: InputDecoration(
                hoverColor: Color.fromRGBO(0, 0, 0, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(0, 0, 0, 1)
                  )
                )
              ),
            )
          ],
        )
      ),
      
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ResetPassword())
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
            'Continue',
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