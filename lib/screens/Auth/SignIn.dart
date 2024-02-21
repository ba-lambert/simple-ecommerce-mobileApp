import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/Auth/Register.dart';
import 'package:ecommerce_app/screens/Home.dart';
import 'package:ecommerce_app/widgets/UserInputs.dart';
import 'package:ecommerce_app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formField = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70.h,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
            child: Form(
              key: _formField,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  header(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  userInputs(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hello Again!',
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Welcome Back You've Been\n Missed",
          textAlign: TextAlign.center,
          style: GoogleFonts.aclonica(
            color: Colors.grey[500],
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget userInputs() {
    return Column(
      children: [
        UserInputs(
          label: "username",
          controller: _userController,
          prefixIcon: Icon(Icons.person),
        ),
        UserInputs(
          label: "password",
          controller: _passwordController,
          prefixIcon: Icon(Icons.lock),
          obscure: _obscurePassword,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            child: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recovery Password'),
            Row(
              children: [
                Text(
                  "Don't have an account",
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()))
                        },
                    child: Text(
                      'Signup',
                      style: GoogleFonts.poppins(),
                    )),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomButton(
            text: 'Log In',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          child: ClipRRect(
            child: Image(
              image: const NetworkImage(
                  'https://media.dev.to/cdn-cgi/image/width=1280,height=720,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fpl216rvkx1xcg65i6yb0.png'),
              height: 80.h,
              width: 550.w,
            ),
          ),
        )
      ],
    );
  }

  Widget TopAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }
}
