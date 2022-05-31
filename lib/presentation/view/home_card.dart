import 'dart:math';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

// ignore: camel_case_types
class HomeCard extends StatelessWidget {
  List<Widget> columnChildern;
  bool signinScreen = true;
  HomeCard({
    Key? key,
    required this.columnChildern,
    required this.signinScreen,
  }) : super(key: key);
  bool englishLanguage = false;
  @override
  Widget build(BuildContext context) {
    double mediaqueryWidth = MediaQuery.of(context).size.width;
    double mediaqueryHight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: mediaqueryHight * 0.3,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                signinScreen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: mediaqueryWidth * 0.2,
                            height: mediaqueryHight * 0.05,
                            margin: EdgeInsets.only(
                              top: mediaqueryHight * 0.07,
                              right: mediaqueryWidth * 0.055,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                englishLanguage = !englishLanguage;
                                englishLanguage
                                    ? CacheHelper.saveDataSharedPreference(
                                        key: 'language', value: 'en')
                                    : CacheHelper.saveDataSharedPreference(
                                        key: 'language', value: 'ar');
                                print(CacheHelper.getDataFromSharedPreference(
                                    key: 'language'));
                              },
                              child: Text(
                                CacheHelper.getDataFromSharedPreference(
                                            key: 'language') ==
                                        'ar'
                                    ? "عربي"
                                    : "English",
                                style: const TextStyle(color: AppColor.blue),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
                Image.asset('assets/images/logo.png'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: mediaqueryHight * 0.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: AppColor.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: columnChildern),
          ),
        ],
      ),
    );
  }
}
