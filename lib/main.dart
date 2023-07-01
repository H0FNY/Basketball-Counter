import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenheight = MediaQuery.of(context).size.height;
          return AnimatedSplashScreen(
            duration: 1000,
            pageTransitionType: PageTransitionType.fade,
            splashIconSize: screenheight/3,
            backgroundColor: Color(0xff1D428A),
            // scaleTransition
            splashTransition: SplashTransition.decoratedBoxTransition,
            splash: Image.asset("assets/images/NBA.png",),
            nextScreen: Home(),
          );
        }),
      ),
    );
  }
}


