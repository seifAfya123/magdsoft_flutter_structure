import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custome_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({Key? key}) : super(key: key);
  TextStyle comonTextStyle = const TextStyle(
    color: AppColor.blue,
    fontSize: 22,
  );
  void logout(BuildContext context) {
    CacheHelper.saveDataSharedPreference(key: 'logedin', value: false);
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text("User Data"),
        centerTitle: true,
        backgroundColor: AppColor.blue,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Name: ${CacheHelper.getDataFromSharedPreference(key: 'name')}",
                  style: comonTextStyle,
                ),
                Text(
                  "Email: ${CacheHelper.getDataFromSharedPreference(key: 'email')}",
                  style: comonTextStyle,
                ),
                Text(
                  "Phone: ${CacheHelper.getDataFromSharedPreference(key: 'phone')}",
                  style: comonTextStyle,
                ),
              ],
            ),
            // const Spacer(),
            CustomeButton(
              txt: "Logout",
              function: () {
                logout(context);
              },
              btnColor: AppColor.myRed,
            ),
          ],
        ),
      ),
    );
  }
}
