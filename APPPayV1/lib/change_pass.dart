import 'package:apppayv1/API/get_api.dart';
import 'package:apppayv1/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:apppayv1/profile.dart';

class ChangePass extends StatefulWidget{
  int id;
  ChangePass({super.key, required this.id});
  @override
  State<StatefulWidget> createState() {
   return _ChangePassState();
  }
}

class _ChangePassState extends State<ChangePass>{
  var _oldPassworld = TextEditingController();
  var _newPassworld = TextEditingController();
  var _confirmNewPassword = TextEditingController();
  bool _newObscureText = true;
  bool _oldObscureText = true;
  bool _confirmObscureText = true;

  void changPass() async {
    if(_newPassworld.text.trim() == _confirmNewPassword.text.trim()) {
      bool? isUpdated = await APIService.changePassword(widget.id,
          _oldPassworld.text.trim(), _newPassworld.text.trim());
      if(isUpdated == true) {
        const snackBar = SnackBar(
          content: Center(child: Text("Đổi mật khẩu thành công"),),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then(
                (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false
                )
        );
      }
      else {
        const snackBar = SnackBar(
          content: Center(child: Text("Mật khẩu cũ không chính xác"),),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    else {
      const snackBar = SnackBar(
        content: Center(child: Text("Xác nhận mật khẩu không trùng khớp"),),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
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
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Đổi mật khẩu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(47, 162, 185, 1)
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Vui lòng nhập mật khẩu mới bên dưới khác với mật khẩu trước đó',
                softWrap: true,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 114, 128, 1),
                ),
              ),
              const SizedBox(height: 32),

              TextField(
                controller: _oldPassworld,
                obscureText: _oldObscureText,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'Mật khẩu cũ',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _oldObscureText = !_oldObscureText;
                      });
                    },
                    icon: _oldObscureText ? const Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ) : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ),
                  ),

                  labelStyle: const TextStyle(color: Color.fromRGBO(107, 114, 128, 1)),

                  // Màu nền của textfield
                  filled: true,
                  fillColor: const Color.fromRGBO(249, 250, 251, 1),

                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _newPassworld,
                obscureText: _newObscureText,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'Mật khẩu mới',
                  suffixIcon: IconButton(
                    splashColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _newObscureText = !_newObscureText;
                      });
                    },
                    icon: _newObscureText ? const Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ) : const Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ),
                  ),

                  labelStyle: const TextStyle(color: Color.fromRGBO(107, 114, 128, 1)),

                  // Màu nền của textfield
                  filled: true,
                  fillColor: const Color.fromRGBO(249, 250, 251, 1),

                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _confirmNewPassword,
                obscureText: _confirmObscureText,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'Xác nhận mật khẩu mới',
                  suffixIcon: IconButton(
                    splashColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _confirmObscureText = !_confirmObscureText;
                      });
                    },
                    icon: _confirmObscureText ? const Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ) : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromRGBO(107, 114, 128, 1)
                    ),
                  ),

                  labelStyle: const TextStyle(color: Color.fromRGBO(107, 114, 128, 1)),

                  // Màu nền của textfield
                  filled: true,
                  fillColor: const Color.fromRGBO(249, 250, 251, 1),

                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ElevatedButton(
          onPressed: () => changPass(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(47, 162, 185, 1),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          child: const Text(
            'Đổi mật khẩu',
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