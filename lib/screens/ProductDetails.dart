import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/arrowback_ic.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    "Men's Shoes",
                    style: GoogleFonts.montserrat(
                        fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/cart_ic.svg',
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 250.h,
                  child: Image.asset(
                    product['photos'][0],
                    height: 500.h,
                  ),
                ),
              ),
              Text(
                'Best Seller'.toUpperCase(),
                style: GoogleFonts.montserrat(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                product['title'],
                style: GoogleFonts.montserrat(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                product['price'],
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                product['description'],
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
