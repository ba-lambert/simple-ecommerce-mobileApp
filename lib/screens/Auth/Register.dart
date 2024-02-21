import 'package:ecommerce_app/screens/Auth/SignIn.dart';
import 'package:ecommerce_app/widgets/UserInputs.dart';
import 'package:ecommerce_app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Text(
                  'New user',
                  style: GoogleFonts.poppins(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Create Account \n Thank you for choosing us',
                  style: GoogleFonts.poppins(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                userInputs(context),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(text: "sign up", onPressed: () {}),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: GoogleFonts.poppins(),
                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                        child: Text(
                          'login',
                          style: GoogleFonts.poppins(),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget userInputs(BuildContext context) {
    TextEditingController _usernamecontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    TextEditingController _emailcontroller = TextEditingController();
    return Column(
      children: [
        UserInputs(label: "username", controller: _usernamecontroller),
        UserInputs(label: "email", controller: _emailcontroller),
        UserInputs(
          label: "password",
          controller: _passwordcontroller,
          obscure: visibility,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                visibility = !visibility;
              });
            },
            child: Icon(visibility ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        UserInputs(
            prefixIcon: const Icon(Icons.lock),
            label: "confirm-password",
            controller: _passwordcontroller),
      ],
    );
  }
}
