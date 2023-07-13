import 'package:dsc/dashboard/home.dart';
import 'package:dsc/login_ui/sing_up_page.dart';
import 'package:dsc/providers/userProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginUiPage extends StatefulWidget {
  const LoginUiPage({super.key});

  @override
  State<LoginUiPage> createState() => _LoginUiPageState();
}

class _LoginUiPageState extends State<LoginUiPage> {
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _InputPasswordUserController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserLoginProvider>(context);
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
                'welcome_image_login.png',
                width: 260,
                height: 220,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 34,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 40,
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
                controller: _InputPasswordUserController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Color(0xfff97d7d),
                    )),
              ),
              Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  elevation: 0,
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: Color(0xfff97d7d)),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: MaterialButton(
                  color: const Color(0xfff97d7d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    final isFound = prov.userLoginList.any((user) =>
                        user.email == _inputEmailUserController.text &&
                        user.password == _InputPasswordUserController.text);
                    if (isFound) {
                      //ambil data yg login itu
                      final dataUser = prov.userLoginList.firstWhere(
                        (user) =>
                            user.email == _inputEmailUserController.text &&
                            user.password == _InputPasswordUserController.text,
                      );

                      //simpan id user yg login
                      prov.userDoLogin(dataUser.id);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));

                      //jika userlogin tidak ditemukan maka muncul notif
                    }
                    // Navigator.pushReplacement(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (c, a1, a2) => const home(),
                    //     transitionsBuilder: (c, anim, a2, child) =>
                    //         FadeTransition(opacity: anim, child: child),
                    //     transitionDuration: const Duration(milliseconds: 1000),
                    //   ),
                    // );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'or,login,with...',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFBDBDBD),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          'google.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFBDBDBD),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          'fb.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFBDBDBD),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          'apple.jpeg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "if haven't an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                  TextSpan(
                    text: 'Register',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const SingUpPage(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration:
                                const Duration(milliseconds: 1000),
                          ),
                        );
                      },
                    style: const TextStyle(
                        color: Color(0xffee0f37),
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ]),
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
