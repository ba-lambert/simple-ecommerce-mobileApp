import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInputs extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;
  const UserInputs({
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            obscureText: obscure ?? false,
            decoration: InputDecoration(
              hintText: 'Enter $label',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              fillColor: AppColors.secondaryColor,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 5.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
