import 'package:flutter/material.dart';
import 'package:apppayv1/passworld_recovery.dart';

class Verify extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerifyState();
  }
}

class _VerifyState extends State<Verify>{
  bool _isCheckedEmail = true;
  bool _isCheckedSms = false;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(''),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(29, 171, 135, 1),
                borderRadius: BorderRadius.all(Radius.circular(1000))
              ),
              child: const Icon(
                Icons.lock_outline,
                size: 35,
                shadows: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 4,
                    spreadRadius: 5,
                    offset: Offset(3, 3)
                  )
                ],
              )
            ),
            const SizedBox(height: 16),

            const Text(
              'Password Revovery',
                style: TextStyle(
                  color: Color.fromRGBO(47, 162, 185, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -.2
                ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Check your email / SMS to receive the code',
              style: TextStyle(
                color: Color.fromRGBO(107, 114, 128, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: .3
              ),
            ),
            const SizedBox(height: 16),

           Card(
            color: const Color.fromRGBO(249, 250, 251, 1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16)
              )
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:Checkbox(
                      value: _isCheckedEmail, 
                      activeColor: const Color.fromRGBO(29, 171, 135, 1),
                      shape: const CircleBorder(),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(.1)
                      ),
                      onChanged: (bool? value){
                        setState(() {
                          if(value == null){
                            _isCheckedEmail = false;
                            _isCheckedSms = true;
                          }else{
                            _isCheckedEmail = true;
                            _isCheckedSms = false;
                          }
                          // _isCheckedEmail = value ?? false;
                          // _isCheckedSms = false;
                        });
                      }
                    )
                  ),

                  const Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: .3,
                            color: Color.fromRGBO(47, 162, 185, 1)
                          ),
                        ),

                        Text(
                          'T*******@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: .3,
                            color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                        ),
                      ],
                    )
                  ),

                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.email_outlined,
                      color: Color.fromRGBO(156, 163, 175, 1),
                    )
                  )
                ],
              ),
            ),
           ),
          const SizedBox(height: 16),

            Card(
            color: const Color.fromRGBO(249, 250, 251, 1),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:Checkbox(
                      value: _isCheckedSms, 
                      activeColor: const Color.fromRGBO(29, 171, 135, 1),
                      shape: const CircleBorder(),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(.1)
                      ),
                      onChanged: (bool? value){
                        setState(() {
                          // _isCheckedSms = value ?? false;
                          if(value == null){
                            _isCheckedEmail = true;
                            _isCheckedSms = false;
                          }else{
                            _isCheckedEmail = false;
                            _isCheckedSms = true;
                          }
                        });
                      }
                    )
                  ),

                  const Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SMS',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: .3,
                            color: Color.fromRGBO(47, 162, 185, 1)
                          ),
                        ),

                        Text(
                          '**********446',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: .3,
                            color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                        ),
                      ],
                    )
                  ),

                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.email_outlined,
                      color: Color.fromRGBO(156, 163, 175, 1),
                    )
                  )
                ],
              ),
            ),
           ),
          ]
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Recovery()
              )
            );
          },
        
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(47, 162, 185, 1),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16)
              )
            )
          ),
          child: const Text(
            'Continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: .3
            ),
          )
        ),
      )
    );
  }
}

