import 'package:apppayv1/API/get_api.dart';
import 'package:apppayv1/service/chat_service.dart';
import 'package:flutter/material.dart';

import 'models/account.dart';

class UserRequest extends StatefulWidget {
  Account account;
  UserRequest({super.key, required this.account});

  @override
  State<UserRequest> createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  final _controller = TextEditingController();
  final _chatService = ChatService();
  List<dynamic> list = [];

  void _getRequest() async {
    List<dynamic> data = await APIService.getRequest(widget.account.id);
    list = data.reversed.toList();
    list.forEach((element) {
      _chatService.addMessage({
        "content": element['content'],
        "answer": element['answer']
      });
    });
  }
  String checkString(String text) {
    String res = "";
    for(int i = 3; i < text.length; i++) {
      if(text[i] == '<') break;
      res += text[i];
    }
    return res;
  }

  void sendMessage(Map<String, dynamic> message) {
    _chatService.addMessage(message);
  }

  @override
  void initState() {
    super.initState();
    _getRequest();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: SingleChildScrollView(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _chatService.messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  return Column(
                    children: List.generate(data!.length, (index) => _buildMessageItem(checkString(data[index]['content']), checkString(data[index]['answer'] ?? ""))),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),),
          const SizedBox(height: 10,),
          _messageTool(),
          const SizedBox(height: 30,),
        ],
      )
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)
                ),
                child: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,),
              )
          ),
          Expanded(child: Container()),
          const Text("Trợ giúp", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
          Expanded(child: Container()),
          Container(
            width: 40,
            height: 40,
          )
        ],
      ),
    );
  }
  Widget _buildMessageItem(String from, String to) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.account.name),
                  const SizedBox(height: 5,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    elevation: 8,
                    shadowColor: Colors.grey[100],
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(from),
                    ),
                  ),
                ],
              ),
            ),
          ),
          to == "" ? Container() : Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Admin"),
                  const SizedBox(height: 5,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    elevation: 8,
                    shadowColor: Colors.grey[100],
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(to),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _messageTool() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: _controller,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              sendMessage({
                'content': "cai cc",
                'answer': "cc"
              });
              _controller.clear();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.send, color: Colors.blue, size: 30,),
            ),
          ),
          hintText: "Nhắn tin ...",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),
          fillColor: const Color(0x77777C8A),
          filled: true,
        ),
      ),
    );
  }
}
