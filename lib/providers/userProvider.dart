import 'package:flutter/material.dart';
import 'package:dsc/models/userModel.dart';
import 'package:uuid/uuid.dart';

class UserLoginProvider with ChangeNotifier {
  final uuid = Uuid();
  List<NewUser> _userLoginList = [
    NewUser(
      id: Uuid().v1(),
      username: 'Turu Project',
      email: 'turuProject@gmail.com',
      noHp: '082163577068',
      password: '12345678',
      address: 'Medan',
      tanggalLahir: '27-08-2002',
    ),
  ];

  List<NewUser> get userLoginList => _userLoginList;

  String _idUserDoLogin = '';
  String get idUserDoLogin => _idUserDoLogin;

  void userDoLogin(id) {
    _idUserDoLogin = id;
    notifyListeners();
  }

  void register(NewUser user) {
    print(user.username);
    _userLoginList.add(user);
    notifyListeners();
  }
}
