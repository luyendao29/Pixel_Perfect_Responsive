import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect_responsive/widget/finos_button.dart';
import 'package:styled_widget/styled_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 640),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(fontSize: 20.sp),
        ),
        backgroundColor: const Color(0xFF306EDF),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52.h),
              const Text('Sign Up to Master')
                  .fontSize(18.sp)
                  .fontWeight(FontWeight.w700)
                  .textColor(Colors.black),
              SizedBox(height: 4.h),
              Wrap(
                children: [
                  const Text('Already have an account?')
                      .fontWeight(FontWeight.w700)
                      .textColor(Colors.grey)
                      .fontSize(14.sp),
                  const Text('Login')
                      .fontWeight(FontWeight.w700)
                      .textColor(Colors.purple)
                      .fontSize(14.sp),
                ],
              ),
              SizedBox(height: 24.h),
              const _buidTextField(hint: 'UserName'),
              SizedBox(height: 16.h),
              const _buidTextField(hint: 'Email'),
              SizedBox(height: 16.h),
              const _buidTextField(hint: 'Password'),
              SizedBox(height: 16.h),
              const _buidTextField(hint: 'Confirm Password'),
              SizedBox(height: 16.h),
              FinOSButton(
                  text: 'Create Account',
                  colorBackground: const Color(0xFF306EDF),
                  onPressed: () {}),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.red,
                  )),
                  SizedBox(width: 16.w),
                  const Text('or Sign up via')
                      .fontWeight(FontWeight.w500)
                      .textColor(Colors.lightGreen)
                      .fontSize(14.sp),
                  SizedBox(width: 16.w),
                  const Expanded(
                      child: Divider(
                    color: Colors.red,
                  )),
                ],
              ).padding(top: 24.h),
              FinOSButton(
                text: 'Google',
                colorBackground: const Color(0xFF306EDF),
                onPressed: () {},
                iconPath: 'assets/icons/vietnam',
              ).padding(top: 16.h),
            ],
          ).padding(horizontal: 24.w),
        ),
      ),
    );
  }
}

class _buidTextField extends StatelessWidget {
  final String hint;

  const _buidTextField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: Colors.lightGreenAccent,
        hintText: hint,
      ),
    );
  }
}
