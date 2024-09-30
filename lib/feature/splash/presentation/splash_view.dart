import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/feature/Lay_Out/Lay_Out_View.dart';
class Splash_View extends StatefulWidget {
  static const String routeName = "/";

  const Splash_View({super.key});
  @override
  State<Splash_View> createState() => _Splash_ViewState();
}

class _Splash_ViewState extends State<Splash_View> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, Lay_Out_View.routeName);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Image.asset("assets/images/dark_splash.png" , fit: BoxFit.cover,);
  }
}
