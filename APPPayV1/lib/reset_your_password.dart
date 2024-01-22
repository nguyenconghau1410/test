import 'package:flutter/material.dart';
import 'package:apppayv1/passworld_recovery.dart';

class ResetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends State<ResetPassword>{
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  var _obscureTextPassword = true;
  var _obscureTextConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _passwordController.text = '123456';
  }

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
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Recovery())
                );
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
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Create New Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(47, 162, 185, 1)
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Please, enter a new password below different from the previous password',
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              obscureText: _obscureTextPassword,
              decoration: InputDecoration(
                hintText: 'Enter password',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(156, 163, 175, 1)
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  ),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: const Color.fromRGBO(249, 250, 251, 1),
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      _obscureTextPassword = !_obscureTextPassword;
                    });
                  }, 
                  icon:const  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  )
                )
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureTextConfirmPassword,
              decoration: InputDecoration(
                hintText: 'Comfirm password',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(156, 163, 175, 1)
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  ),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: const Color.fromRGBO(249, 250, 251, 1),
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                    });
                  }, 
                  icon:const  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  )
                )
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: () => print('Create new password'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(47, 162, 185, 1),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          child: const Text(
            'Create new password',
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