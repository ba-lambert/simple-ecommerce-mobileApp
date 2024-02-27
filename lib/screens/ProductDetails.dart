import 'package:ecommerce_app/screens/Products/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool showFullDescription = false;
  int imageIndex = 0;
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
                    onTap: () => Navigator.pop(context),
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
      body: Stack(children: [
        Positioned.fill(
          child: SingleChildScrollView(
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
                        widget.product['photos'][imageIndex],
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
                    widget.product['title'],
                    style: GoogleFonts.montserrat(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.product['price'],
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    showFullDescription
                        ? widget.product['description']
                        : _truncateDescription(widget.product['description']),
                    style: GoogleFonts.montserrat(color: Colors.grey),
                  ),
                  if (widget.product['description'].split(' ').length > 50)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showFullDescription = !showFullDescription;
                        });
                      },
                      child: Text(
                        showFullDescription ? 'Read Less' : 'Read More',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Gallery',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0;
                            i < widget.product["photos"].length;
                            i++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  imageIndex = i;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  widget.product["photos"][i],
                                  width: 50.w, // Adjust the width of each image
                                  height:
                                      50.h, // Adjust the height of each image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Sizes',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 6.w,
            bottom: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      widget.product['price'],
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 130.w,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // Button border radius
                      side:
                          const BorderSide(color: Colors.blue), // Border color
                    ),
                    textStyle: GoogleFonts.montserrat(), // Text style
                  ),
                  child: Text(
                    'Add To Cart',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ))
      ]),
    );
  }

  String _truncateDescription(String description) {
    final words = description.split(' ');
    if (words.length > 50) {
      return words.sublist(0, 25).join(' ') + '...';
    }
    return description;
  }
}
