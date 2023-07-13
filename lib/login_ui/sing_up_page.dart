import 'package:dsc/dashboard/home.dart';
import 'package:dsc/login_ui/login_ui_page.dart';
import 'package:dsc/models/userModel.dart';
import 'package:dsc/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool isActive = false;
  final TextEditingController _inputUsernameController =
      TextEditingController();
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _inputNumberController = TextEditingController();
  final TextEditingController _inputPasswordUserController =
      TextEditingController();
  final TextEditingController _inputAddressUserController =
      TextEditingController();
  String? dateStartInput;

  // void myNotif(String msg, Color color) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: color,
  //       textColor: Colors.black,
  //       fontSize: 16.0);
  // }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserLoginProvider>(context);
    var uuid = Uuid();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Image.asset(
                'sign_up.png',
                width: 260,
                height: 220,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 34,
              ),
              const Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _inputUsernameController,
                decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.person_outline_sharp,
                      size: 22,
                      color: Color(0xfff97d7d),
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                controller: _inputEmailUserController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xfff97d7d),
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                controller: _inputPasswordUserController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Color(0xfff97d7d),
                    )),
              ),
              TextField(
                controller: _inputNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xfff97d7d),
                    )),
              ),
              TextField(
                controller: _inputAddressUserController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Color(0xfff97d7d),
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: DateTimePicker(
                        icon: Icon(
                          Icons.date_range,
                          color: Color(0xfff97d7d),
                        ),
                        type: DateTimePickerType.date,
                        initialValue: '',
                        dateHintText: 'Tanggal Lahir',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (val) => {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val))
                        },
                        validator: (val) {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val!));
                          return null;
                        },
                        onSaved: (val) => {
                          dateStartInput = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(val!))
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isActive,
                    onChanged: (value) => setState(() {
                      isActive = value!;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'I agree whit the terms and conditions\nand privacy policy',
                      style: TextStyle(color: Colors.grey[400], fontSize: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: MaterialButton(
                  color: const Color(0xfff97d7d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_inputUsernameController.text != '' ||
                        _inputEmailUserController.text != '' ||
                        _inputNumberController.text != '' ||
                        _inputPasswordUserController.text != '') {
                      prov.register(NewUser(
                        id: uuid.v1(),
                        username: _inputUsernameController.text,
                        email: _inputEmailUserController.text,
                        noHp: _inputNumberController.text,
                        password: _inputPasswordUserController.text,
                        tanggalLahir: dateStartInput.toString(),
                        address: _inputAddressUserController.text,
                      ));

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginUiPage()));
                    }
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (c, a1, a2) => const LoginUiPage(),
                    //     transitionsBuilder: (c, anim, a2, child) =>
                    //         FadeTransition(opacity: anim, child: child),
                    //     transitionDuration: const Duration(milliseconds: 1000),
                    //   ),
                    // );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
