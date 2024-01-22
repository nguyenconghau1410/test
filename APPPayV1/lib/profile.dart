import 'dart:io';

import 'package:apppayv1/login_screen.dart';
import 'package:apppayv1/models/account.dart';
import 'package:apppayv1/models/user.dart';
import 'package:apppayv1/storage/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:apppayv1/change_pass.dart';
import 'package:apppayv1/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget{
  Account account;
  Profile({super.key, required this.account});
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile>{
  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _roleController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  late AppPreferences _appPreferences;
  Future<void> _loadImage() async {
    final String? imagePath = _appPreferences.preferences?.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _image = XFile(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      await _appPreferences.preferences?.setString("imagePath", pickedFile.path);
      setState(() {
        _image = pickedFile;
      });
    }
  }
  
  @override
  void initState() {
    super.initState();
    _fullnameController.text = widget.account.name;
    _roleController.text = widget.account.roles.role[0].name;
    _phoneController.text = widget.account.user_name;
    _emailController.text = widget.account.email == "" ? "none" : widget.account.email;
    _appPreferences = AppPreferences();
    _appPreferences.init();
    _loadImage();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white,
    appBar: _appBar(),
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Stack(
              children: [
                InkWell(
                  onTap: () async {
                    await _pickImage();
                  },
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: _image == null
                          ? Image.asset("images/user.jpg", width: 80, height: 80,)
                          : Image.file(File(_image!.path), width: 80, height: 80, fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 2,
                      top: MediaQuery.of(context).size.height / 13
                  ),
                  decoration: BoxDecoration(
                      color:const Color.fromRGBO(251, 187, 0, 1),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(1000)
                      ),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(255, 255, 255, 1)
                      )
                  ),
                  child: InkWell(
                    onTap: (){
                    },
                    child: Image.asset(
                      'images/Group.png',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              'Thông tin cá nhân',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .3,
                  color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),
            const SizedBox(height: 16),

            Container(
                width:  MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(16)
                    ),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(243, 244, 246, 1)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      textAlign: TextAlign.right,
                      controller: _fullnameController,
                      decoration: const InputDecoration(
                          prefixText: 'Họ và tên',
                          enabled: false,
                          prefixStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .3,
                              color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: _roleController,
                      decoration: const InputDecoration(
                          prefixText: 'Vai trò',
                          enabled: false,
                          prefixStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .3,
                              color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                    Column(
                      children: List.generate(widget.account.users.user.length, (index) => _listUser(widget.account.users.user[index])),
                    )
                  ],
                )
            ),
            const SizedBox(height: 16),

            const Text(
              'Thông tin liên hệ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .3,
                  color: Color.fromRGBO(107, 114, 128, 1)
              ),
            ),
            const SizedBox(height: 16),

            Container(
                width:  MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(16)
                    ),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(243, 244, 246, 1)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      textAlign: TextAlign.right,
                      controller: _phoneController,
                      enabled: false,
                      decoration: const InputDecoration(
                          prefixText: 'Số điện thoại',
                          prefixStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .3,
                              color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),

                    TextField(
                      textAlign: TextAlign.right,
                      controller: _emailController,
                      enabled: false,
                      decoration: const InputDecoration(
                          prefixText: 'Email',
                          prefixStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .3,
                              color: Color.fromRGBO(107, 114, 128, 1)
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 16),

            Container(
                width:  MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(16)
                    ),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(243, 244, 246, 1)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            'Change Password',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .3,
                                color: Color.fromRGBO(251, 187, 0, 1)
                            )
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChangePass(id: widget.account.id,))
                            );
                          },
                          child: const Icon(Icons.keyboard_arrow_right_rounded),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .3,
                                color: Color.fromRGBO(241, 67, 54, 1)
                            )
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    (route) => false
                            );
                          },
                          child: const Icon(Icons.keyboard_arrow_right_rounded),
                        )
                      ],
                    )
                  ],
                )
            )

          ],
        ),
      ),
    )
   );
  }
  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 100),
              child: const Text(
                'Thông tin tài khoản',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .3,
                    color: Color.fromRGBO(0, 0, 0, 1)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _listUser(User user) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            user.name,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: .3,
                color: Color.fromRGBO(77, 77, 77, 1)
            ),
          ),
        ],
      ),
    );
  }
}