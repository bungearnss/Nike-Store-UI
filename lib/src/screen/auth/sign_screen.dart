import 'package:flutter/material.dart';

import '../../util/appColor.dart';
import '../../components/custombutton.dart';

import '../../screen/home/hompage_screen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> with TickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();
  final _conpassController = TextEditingController();
  final _mailController = TextEditingController();
  int tabIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final defaultTab = [
      Container(
        width: 80,
        padding: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: appColors.txtGrey),
        ),
      ),
      Container(
        width: 80,
        padding: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: appColors.txtGrey),
        ),
      ),
    ];

    final textFeild = [
      Input(
        hintTxt: "Username",
        icon: "assets/icons/user_icon.png",
        controller: _usernameController,
      ),
      Input(
        hintTxt: "Password",
        icon: "assets/icons/lock_icon.png",
        controller: _passController,
      ),
      Input(
        hintTxt: "Confirm Password",
        icon: "assets/icons/lock_icon.png",
        controller: _conpassController,
      ),
      Input(
        hintTxt: "Email",
        icon: "assets/icons/mail_icon.png",
        controller: _mailController,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: appColors.primaryColor,
                    width: width,
                    height: 10,
                  ),
                  const SizedBox(height: 35),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Image.asset("assets/images/nike_logo.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 0.9, color: Color(0xFFe8e8e8)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tabIndex = 0;
                            });
                          },
                          child: tabIndex == 0
                              ? selectTab("Sign In")
                              : defaultTab[0],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tabIndex = 1;
                            });
                          },
                          child: tabIndex == 1
                              ? selectTab("Sign Up")
                              : defaultTab[1],
                        ),
                      ],
                    ),
                  ),
                  textFieldBody(textFeild),
                ],
              ),
              Positioned(
                bottom: 70,
                left: 40,
                child: Column(children: [
                  const SizedBox(height: 20),
                  CustomButton(
                    title: tabIndex == 0 ? "Sign In" : "Sign Up",
                    txtColor: appColors.primaryColor,
                    bgColor: const Color(0xFF121314),
                  ),
                  const SizedBox(height: 20),
                  tabIndex == 0
                      ? CustomButton(
                          title: "Login with Facebook",
                          txtColor: Colors.white,
                          bgColor: appColors.blueColor,
                        )
                      : Container(),
                  const SizedBox(height: 30),
                  tabIndex == 0
                      ? const Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Color(0xFF121314),
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : Container(),
                ]),
              ),
              Positioned(
                bottom: 20,
                left: width * 0.29,
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_add_outlined,
                      color: Color.fromARGB(255, 218, 218, 218),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomepageScreen())),
                      child: const Text(
                        "Sign In with Guest",
                        style: TextStyle(
                          color: Color.fromARGB(255, 183, 183, 183),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget txtFeildItem(
      TextEditingController controller, String hintTxt, String icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          hintText: hintTxt,
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(235, 158, 202, 0), width: 2),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appColors.txtGrey, width: 0),
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: appColors.txtGrey, fontWeight: FontWeight.w300),
          prefixIcon: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              icon,
              scale: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldBody(List<Input> textField) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      margin: const EdgeInsets.only(top: 10),
      height: tabIndex == 0 ? 150 : 300,
      child: tabIndex == 0
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                final item = textField[index];
                return txtFeildItem(
                  item.controller,
                  item.hintTxt,
                  item.icon,
                );
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: textField.length,
              itemBuilder: (context, index) {
                final item = textField[index];
                return txtFeildItem(
                  item.controller,
                  item.hintTxt,
                  item.icon,
                );
              },
            ),
    );
  }

  Widget selectTab(String title) {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Color(0xFF121314),
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black),
      ),
    );
  }
}

class Input {
  String hintTxt;
  String icon;
  TextEditingController controller;

  Input({required this.hintTxt, required this.icon, required this.controller});
}
