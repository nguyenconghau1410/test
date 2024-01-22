import 'package:apppayv1/API/base_url.dart';
import 'package:apppayv1/API/get_api.dart';
import 'package:apppayv1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey =GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true;
  var isChecked = false;

  void login() async {
    String? access_token = await APIService.login(usernameController.text.trim(),
                                  passwordController.text.trim());
    if(access_token != null) {
      BaseURL.access_token = access_token;
      const snackBar = SnackBar(
        content: Center(child: Text("Đăng nhập thành công"),),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(user_name: usernameController.text.trim()))
        )
      );
    }
    else {
      const snackBar = SnackBar(
        content: Center(child: Text("Đăng nhập không thành công"),),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Center(
              child: Image.asset(
                "images/image1.jpg",
                width: 171,
                height: 204,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 30, bottom: 40),
              child: Text("Đăng nhập", style: TextStyle(fontSize: 24, fontFamily: "Inter", fontWeight: FontWeight.w600),),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      validator: (val) => val == "" ? "Hãy nhập username của bạn" : null,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObscure,
                      validator: (val) => val == "" ? "Hãy nhập mật khẩu của bạn" : null,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.black26,),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            )
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        const Text("Nhớ mật khẩu", ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {

                          },
                          child: const Text("Quên mật khẩu ?", style: TextStyle(color: Color(0xFF4FA9BA)),),
                        ),
                        const SizedBox(width: 5,)
                      ],
                    ),
                    const SizedBox(height: 30,),
                    InkWell(
                      onTap: () {
                        login();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color(0xFF4FA9BA),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(child: Text("Đăng nhập", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có tài khoản ?  "),
                        InkWell(
                          onTap: () {

                          },
                          child: const Text("Đăng ký", style: TextStyle(color: Color(0xFF4FA9BA)),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
