import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home%20screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custome_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/tosts.dart';

class TwoOptionsRow extends StatelessWidget {
  bool isInLoginScreen;
  late bool isValid;
  Function fun;
  String? email;
  String? password;
  String? phone;
  String? name;

  TwoOptionsRow({
    Key? key,
    required this.isInLoginScreen,
    // required this.isValid,
    required this.fun,
    this.email,
    this.password,
    this.phone,
    this.name,
  }) : super(key: key);
  void unFocusKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Tosts tosta = Tosts();
  void gotoLoginScreen(BuildContext context) async {
    unFocusKeyboard(context);
    if (isInLoginScreen) {
      isValid = fun();
      if (isValid) {
        var body = {
          'email': email!,
          'password': password!,
        };
        MyResponse data =
            await DioHelper.postData(url: baseURL + 'login', body: body);
        if (data.status == 200) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          //shared prefrance
          CacheHelper.saveDataSharedPreference(key: 'logedin', value: true);
          Person person = Person.fromJson(data.persons![0]);
          // saving values in shared prefrance
          CacheHelper.saveDataSharedPreference(key: 'name', value: person.name);
          CacheHelper.saveDataSharedPreference(
              key: 'email', value: person.email);
          CacheHelper.saveDataSharedPreference(
              key: 'phone', value: person.phone);
        } else {
          tosta.errorTosta(data.message!);
        }
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  void gotoRegisterScreen(BuildContext context) async {
    unFocusKeyboard(context);
    if (isInLoginScreen) {
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    } else {
      isValid = fun();
      if (isValid) {
        var body = {
          'name': name!,
          'email': email!,
          'password': password!,
          'phone': phone!,
        };
        MyResponse data =
            await DioHelper.postData(url: baseURL + 'register', body: body);
        if (data.message == 'Account Created Successfully') {
          tosta.goodTosta(data.message!);
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          tosta.errorTosta(data.message!);
          //tosta
        }
      }
      // validate then to the loginsceen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomeButton(
          txt: "Register",
          function: () {
            gotoRegisterScreen(context);
          },
          btnColor: AppColor.blue,
        ),
        CustomeButton(
          txt: "Login",
          function: () {
            gotoLoginScreen(context);
          },
          btnColor: AppColor.blue,
        ),
      ],
    );
  }
}
