import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [

        ],
      ),
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
          const Text("Notification", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
          Expanded(child: Container()),
          InkWell(
              onTap: () async {
                await initNotifications();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Image.asset("images/tabler_checks.png")
              )
          ),
        ],
      ),
    );
  }
}
