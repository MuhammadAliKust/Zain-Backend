import 'package:flutter/material.dart';
import 'package:zain_backend/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;

  void setUser(UserModel model) {
    _userModel = model;
    notifyListeners();
  }

  UserModel? getUser() => _userModel;
}
