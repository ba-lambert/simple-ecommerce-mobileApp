import 'package:ecommerce_app/screens/Auth/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'constants/colors.dart';
import 'Pages/OnBoarding/onboardinngItems.dart';

Future<void> setPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstTime', false);
}

Future<bool> getIsFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isFirstTime') ?? true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await getIsFirstTime();
  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatefulWidget {
  final bool isFirstTime;

  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(isFirstTime);
}

class _MyAppState extends State<MyApp> {
  late bool isFirstTime;

  _MyAppState(this.isFirstTime);

  @override
  Widget build(BuildContext context) {
    if (isFirstTime == null) {
      return Container();
    } else {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: const MaterialColor(0xFF03396c, <int, Color>{
                50: Color(0xFFE4EDF4),
                100: Color(0xFFB9CAD9),
                200: Color(0xFF8AA3BD),
                300: Color(0xFF5C7C9E),
                400: Color(0xFF3D5E85),
                500: Color(0xFF03396C),
                600: Color(0xFF02355F),
                700: Color(0xFF012C50),
                800: Color(0xFF012447),
                900: Color(0xFF001A36),
              }),
            ),
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splash: SplashScreen(),
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: isFirstTime ? Welcome() : LoginScreen(),
            ),
          );
        },
      );
    }
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final controller = OnBoardingItems();
  final OnboardingController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
        child: isLastPage
            ? getStartedButton(context)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      OnboardingController.jumpToPage(
                          controller.items.length - 1);
                    },
                    child: Text('Skip'),
                  ),
                  SmoothPageIndicator(
                    controller: OnboardingController,
                    count: controller.items.length,
                    onDotClicked: (index) => OnboardingController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect: WormEffect(
                      dotColor: AppColors.primaryColor,
                      dotHeight: 5.h,
                      dotWidth: 40.w,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      OnboardingController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
      ),
      body: PageView.builder(
        onPageChanged: (index) => setState(() {
          isLastPage = controller.items.length - 1 == index;
        }),
        itemCount: controller.items.length,
        controller: OnboardingController,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(controller.items[index].image),
              SizedBox(
                height: 10.h,
              ),
              Text(controller.items[index].title),
            ],
          );
        },
      ),
    );
  }
}

Widget getStartedButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.primaryVariant,
    ),
    width: 300.w,
    height: 30.h,
    child: TextButton(
      onPressed: () {
        setPreferences();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Text(
        'Get Started',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        ),
      ),
    ),
  );
}
