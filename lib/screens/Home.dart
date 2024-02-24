import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          70.h,
        ),
        child: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Icon(Icons.menu),
          ),
          title: const Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('Store location'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_activity),
                    Text('Kigali Rwanda'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
