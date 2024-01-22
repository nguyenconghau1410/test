import 'dart:convert';

import 'package:apppayv1/API/base_url.dart';
import 'package:apppayv1/models/account.dart';
import 'package:apppayv1/models/user_reciept.dart';
import 'package:http/http.dart' as http;
class APIService {
  static Future<Account> getAccount(String username) async {
    try {
      Map<String, dynamic> mp = {
        "user_name": username
      };
      final response = await http.get(
          Uri.parse(BaseURL.getAccount).replace(queryParameters: mp)
      );
      if(response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return Account.fromJson(data);
      }
      else {
        print(response.statusCode);
        throw Exception('Failed to load account');
      }
    } catch(e) {
      throw Exception('Error during API call: $e');
    }
  }
  static Future<List<UserReceipt>> getUserReceipt(int users_id) async {
    try {
      Map<String, dynamic> mp = {
        'users_id': users_id.toString(),
      };
      final response = await http.get(
          Uri.parse(BaseURL.getUserReceipt).replace(queryParameters: mp)
      );
      if(response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> listJson = data['data'];
        List<UserReceipt> list = [];
        listJson.forEach((element) {
          list.add(UserReceipt.fromJson(element));
        });
        return list;
      }
      else {
        throw Exception("Failed to get userReceipt");
      }
    } catch(e) {
      throw Exception('Error during API call: $e');
    }
  }
  static Future<Map<String, dynamic>> getTotalPrice(int accounts_id) async {
    try {
      Map<String, dynamic> mp = {
        "accounts_id": accounts_id.toString()
      };
      final response = await http.get(
          Uri.parse(BaseURL.getTotalPrice).replace(queryParameters: mp)
      );
      if(response.statusCode == 200) {
        return json.decode(response.body)['data'];
      }
      else {
        print(response.statusCode);
        throw Exception('Error');
      }
    }
    catch(e) {
      throw Exception('Error during API call: $e');
    }
  }
  static Future<String?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(BaseURL.login),
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode({
          'username': username,
          'password': password
        })
      );
      if(response.statusCode == 200) {
        return json.decode(response.body)['access_token'];
      }
      else {
        return null;
      }
    }
    catch(e) {
      print(e);
    }
  }
  static Future<bool?> changePassword(int id, String oldPassword, String newPassword) async {
    try {
      final response = await http.post(
        Uri.parse(BaseURL.changePasswrod),
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'id': id,
          'old_password': oldPassword,
          'new_password': newPassword
        })
      );
      if(response.statusCode == 200) {
        return json.decode(response.body)['isUpdated'];
      }
      else {
        return null;
      }
    }
    catch(e) {
      print(e);
    }

  }
  static Future<List<dynamic>> getRequest(int accounts_id) async {
    Map<String, dynamic> mp = {
      "from_account": accounts_id.toString()
    };
    try {
      final response = await http.get(
        Uri.parse(BaseURL.getRequest).replace(queryParameters: mp),
        headers: {
          'Content-Type': "application/json"
        }
      );
      if(response.statusCode == 200) {
        return json.decode(response.body)['data'];
      }
      else {
        return [];
      }
    }
    catch(e) {
      rethrow;
    }
  }
  static Future<Map<String, dynamic>?> getNotificationUnread() async {
    try {
      final response = await http.get(
        Uri.parse(BaseURL.getNotificationUnread),
        headers: {
          'Authorization': "Bearer ${BaseURL.access_token}",
          'Content-Type': "application/json"
        }
      );
      if(response.statusCode == 200) {
        return json.decode(response.body);
      }
      else {
        print(response.statusCode);
        return null;
      }
    }
    catch(e) {
      rethrow;
    }
  }
}