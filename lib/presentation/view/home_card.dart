import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

// ignore: camel_case_types
class HomeCard extends StatelessWidget {
  List<Widget> columnChildern;
  HomeCard({
    Key? key,
    required this.columnChildern,
  }) : super(key: key);
  bool englishLanguage = false;
  @override
  Widget build(BuildContext context) {
    double mediaqueryWidth = MediaQuery.of(context).size.width;
    double mediaqueryHight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    englishLanguage = !englishLanguage;
                    englishLanguage
                        ? CacheHelper.saveDataSharedPreference(
                            key: 'language', value: 'en')
                        : CacheHelper.saveDataSharedPreference(
                            key: 'language', value: 'ar');
                    //tosta
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: mediaqueryWidth * 0.2,
                    height: mediaqueryHight * 0.05,
                    margin: EdgeInsets.only(top: mediaqueryHight * 0.07),
                    child: const Text(
                      "عربي",
                      style: TextStyle(color: AppColor.blue),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 13,
                )
              ],
            ),
            Image.asset('assets/images/logo.png'),
          ],
        ),
        Expanded(
          child: Container(
            // width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: AppColor.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: columnChildern),
          ),
        ),
      ],
    );
  }
}
