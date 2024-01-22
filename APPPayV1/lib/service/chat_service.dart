import 'dart:async';

import 'package:apppayv1/API/get_api.dart';

class ChatService {
  final _messageController = StreamController<List<Map<String, dynamic>>>.broadcast();

  Stream<List<Map<String, dynamic>>> get messageStream => _messageController.stream;

  List<Map<String, dynamic>> _chatMessages = [];

  void addMessage(Map<String, dynamic> message) {
    _chatMessages.add(message);
    _messageController.add(_chatMessages);
  }


  void dispose() {
    _messageController.close();
  }
}