// import 'package:ecommerce_app/widgets/Widgets.dart';
import 'package:ecommerce_app/constants/contants.dart';
import 'package:ecommerce_app/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBrandIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.shopping_bag,
          size: 20.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: () {}),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
              SizedBox(width: 48), // The size of the FAB
              IconButton(
                  icon: Icon(Icons.notifications_none), onPressed: () {}),
              IconButton(icon: Icon(Icons.person_outline), onPressed: () {}),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Builder(
          builder: (context) => Container(
            height: 150.h,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/menu_ic.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Store location',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location_ic.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Colors.red,
                          ),
                          Text(
                            'Kigali, Rwanda',
                            style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/cart_ic.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SearchBar(context),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int index = 0; index < brand.length; index++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedBrandIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 30.h,
                          color: _selectedBrandIndex == index
                              ? Colors.blue // Change color if selected
                              : Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    brand[index].logo,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              if (_selectedBrandIndex == index)
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Text(
                                    brand[index].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(width: 10.w), // Add final spacing
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular products',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'see all',
                  style: GoogleFonts.montserrat(
                    color: Colors.lightBlue,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ProductCard(context, productlists),
            )
          ],
        ),
      ),
    );
  }

  Widget SearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search In Our Store',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }

  Widget DrawerWidget(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.transparent, // Make the container transparent
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle drawer item tap
                Navigator.pop(context); // Close the drawer
                // Navigate to settings page or perform other actions
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle drawer item tap
                Navigator.pop(context); // Close the drawer
                // Navigate to about page or perform other actions
              },
            ),
          ],
        ),
      ),
    );
  }
}
