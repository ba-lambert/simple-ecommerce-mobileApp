import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/Auth/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(items: const []),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
          child: Column(
            children: [
              header(context),
            ],
          )),
    );
  }

  Widget header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            )),
        Text(
          'Ecommerce',
          style: GoogleFonts.aclonica(
              fontSize: 20.sp, color: AppColors.primaryColor),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            )),
      ],
    );
  }
}
