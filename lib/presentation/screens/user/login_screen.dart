import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_card.dart';
import 'package:magdsoft_flutter_structure/presentation/view/two_options_row.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/tosts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isvalid() {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (emailController.text.isEmpty || !regex.hasMatch(emailController.text)) {
      tosta.errorTosta("Enter valid email");
    } else {
      if (passwordController.text.isEmpty ||
          passwordController.text.length < 8) {
        tosta.errorTosta("password cannot be empty or\nless than 8 characters");
        b1 = false;
      } else {
        b1 = true;
      }
    }
    return b1;
  }

  //   void saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('token', token);
  // }
  Tosts tosta = Tosts();
  bool b1 = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeCard(
        columnChildern: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.left,
                    // validator: (val) {
                    //   RegExp regex = RegExp(
                    //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    //   if (val!.isEmpty || !regex.hasMatch(val)) {
                    //     // return "Enter valid email";
                    //     tosta.errorTosta("Enter valid email");
                    //   } else {
                    //     b1 = true;
                    //     return null;
                    //   }
                    // },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                        color: AppColor.darkGrey,
                      ),
                      fillColor: AppColor.lightGrey,
                      filled: true,
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    // validator: (val) {
                    //   if ((val!.isEmpty || val.length < 5) && b1) {
                    //     tosta.errorTosta(
                    //         "password cannot be empty or\nless than 8 characters");
                    //   }
                    // },
                    obscureText: !showPassword,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(
                        color: AppColor.darkGrey,
                      ),
                      fillColor: AppColor.lightGrey,
                      filled: true,
                      helperStyle: const TextStyle(color: Colors.redAccent),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: showPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: TwoOptionsRow(
              isInLoginScreen: true,
              fun: isvalid,
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
