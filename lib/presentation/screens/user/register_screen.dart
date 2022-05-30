import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_card.dart';
import 'package:magdsoft_flutter_structure/presentation/view/two_options_row.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custome_text_feild.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/tosts.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  bool isvalid() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeCard(columnChildern: [
        Expanded(
          flex: 4,
          child: loginPart1(context),
        ),
        Expanded(
          // flex: 2,
          child: TwoOptionsRow(
            isInLoginScreen: false,
            isValid: isvalid(),
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
          ),
        ),
      ]),
    );
  }

  bool showPassword = false;
  Tosts tosta = Tosts();

  Widget loginPart1(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ////////////////////////////////for name
            TextFormField(
              textAlign: TextAlign.left,
              controller: nameController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.black,
              validator: (val) {
                RegExp regex = RegExp('');
                if (val!.isEmpty) {
                  return "name cannot be empty";
                }
                if (!regex.hasMatch(val)) {
                  return "invalid name format";
                } else {
                  return null;
                }
              },
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
            /////////////////////////////////// for email
            CustomeTextFeild(
              controller: emailController,
              hintText_: 'Enter mail',
              errorMessage: "invalid email format",
              regExp: RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
            ),
            /////////////////////////////////// for phone number
            CustomeTextFeild(
              controller: phoneController,
              hintText_: 'Enter your phone number',
              errorMessage: "invalid phone number",
              regExp: RegExp(r'^01[0125][0-9]{8}$'),
            ),
            /////////////////////////////////// for password

            TextFormField(
              textAlign: TextAlign.left,
              controller: passwordController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              validator: (val) {
                if (val!.isEmpty) {
                  return "password cannot be empty";
                }
                if (val.length < 8) {
                  return "password cannot be less than 8 characters";
                }
              },
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
                helperMaxLines: 3,
                helperStyle: const TextStyle(color: Colors.redAccent),
              ),
            ),
            /////////////////////////////////// for confirm password
            TextFormField(
              textAlign: TextAlign.left,
              controller: confirmController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              validator: (val) {
                if (val!.isEmpty || confirmController.text != val) {
                  return "passwords not the same ";
                } else {
                  return null;
                }
              },
              obscureText: !showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Confirm your password',
                hintStyle: const TextStyle(
                  color: AppColor.darkGrey,
                ),
                fillColor: AppColor.lightGrey,
                filled: true,
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
    );
  }
}
