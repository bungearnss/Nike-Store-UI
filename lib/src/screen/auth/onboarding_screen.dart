import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../util/appColor.dart';

import './register_screen.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final pages = [
    onBoards(
      img: "assets/images/onboard1.png",
      title: "Welcome",
      des: "Women's Running Tank",
      subDes: "Nike Air",
    ),
    onBoards(
      img: "assets/images/onboard2.png",
      title: "Find Store",
      des: "Nike Pro AeroAdapt",
      subDes: "Men's Tank",
    ),
    onBoards(
      img: "assets/images/onboard3.png",
      title: "Find Store",
      des: "Toddler Short-Sleeve JDI T-Shirt",
      subDes: "Kid's Tank",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  height: height * 0.56,
                  width: width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: height * 0.9,
                      margin: const EdgeInsets.only(left: 10),
                      child: PageView.builder(
                        controller: controller,
                        itemCount: pages.length,
                        itemBuilder: ((context, index) {
                          final item = pages[index];
                          return Stack(children: [
                            const SizedBox(height: 60),
                            Container(
                              height: height * 0.56,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(
                                item.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.54),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(children: [
                                  const SizedBox(height: 60),
                                  Text(
                                    item.title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    item.des,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item.subDes,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            )
                          ]);
                        }),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                left: 0,
                top: 80,
                child: Container(
                  color: appColors.primaryColor,
                  width: 20,
                  height: height * 0.5,
                ),
              ),
              Positioned(
                right: 0,
                top: 80,
                child: Container(
                  color: appColors.primaryColor,
                  width: 20,
                  height: height * 0.5,
                ),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  ),
                  child: Container(
                    color: appColors.primaryColor,
                    width: width,
                    height: 70,
                    child: Center(
                      child: Text(
                        "Started",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
